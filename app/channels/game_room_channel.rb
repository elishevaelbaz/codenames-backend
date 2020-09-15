class GameRoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    game_room = Game.find_by(room_code: params[:room_code])
    stream_for game_room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
