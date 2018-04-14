class GameChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "GameChannel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def move(data)
    if !data.include?("pos") || !data.include?("id")
      return
    end
    x = data["pos"]["x"]
    y = data["pos"]["y"]
    room = data["room"]
    id = data["id"]
    if x >= 0 && x <= 640 && y >= 0 && y <= 512
      ActionCable.server.broadcast("GameChannel", data)
      rooms = Room.class_variable_get(:@@rooms)
      r = rooms[room].players.select{ |p| p.id == id}[0]
      unless r.nil?
       r.x = x
       r.y = y
      end
    end
  end

end
