class GameController < ApplicationController
  MAX_ROOMS = 8

  def index
    Room.new()
  end

  def create
    room = Room.new()
    @rooms = Room.class_variable_get(:@@rooms)
    id = add_player(room).id
    @rooms << room
    render json:  room_id_json(room, id)
  end

  def room_id_json(room, id)
    "{\"room\":#{room.to_json},\"client_id\":#{id}}"
  end

  def add_player(room)
    room.add_player(request.remote_ip)
  end

  def join
    @rooms = Room.class_variable_get(:@@rooms)
    room = @rooms[params["room"].to_i]
    p = add_player(room)
    id = p.id
    data = {"id"=>id, "pos"=>{"x"=>p.x, "y"=>p.y}, "room"=>params["room"].to_i, "action"=>"join"}
    ActionCable.server.broadcast("GameChannel", data)
    render json: room_id_json(room, id)
  end

  def get_rooms
    @rooms = Room.class_variable_get(:@@rooms)
    if @rooms.nil? || @rooms.empty?
      head :no_content
      return
    end
    s = "{\"rooms\":["
    @rooms.each do |room|
      s << "#{room.to_json},"
    end
    render json: s.chomp!(",") << "]}"
  end
end
