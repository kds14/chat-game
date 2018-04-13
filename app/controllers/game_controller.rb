class GameController < ApplicationController
  MAX_ROOMS = 8
  @@rooms = []

  def index
    @@rooms << Room.new()
    @@rooms << Room.new()
  end

  def create
    room = Room.new()
    add_player(room)
    @@rooms << room
    render json:  room_id_json(room, request.remote_ip)
  end

  def room_id_json(room, ip)
    "{\"room\":#{room.to_json},\"client_id\":#{room.client_id(ip)}}"
  end

  def add_player(room)
    room.add_player(request.remote_ip)
  end

  def join
    room = @@rooms[params["room"].to_i]
    add_player(room)
    render json: room_id_json(room, request.remote_ip)
  end

  def get_rooms
    s = "{\"rooms\":["
    @@rooms.each do |room|
      s << "#{room.to_json},"
    end
    render json: s.chomp!(",") << "]}"
  end
end
