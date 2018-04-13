class GameController < ApplicationController
  MAX_ROOMS = 8
  @@rooms = []

  def index
  end

  def create
    @room = Room.new()
    add_player(@room)
    @@rooms << @room
    render json: "{\"room\":#{@room.to_json},\"client_id\":#{@room.client_id(request.remote_ip)}}"
  end

  def add_player(room)
    room.add_player(request.remote_ip)
  end

  def join(room_index)
  end
end
