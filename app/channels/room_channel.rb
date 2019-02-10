class ShiritoriMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params['room_id']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    @message = ShiritoriMessage.new(user_id: current_user.id, body: data['message'],
                                      room:Room.find(params['room_id']))
    @last_message = ShiritoriMessage.last
    @message.save! if @last_message.body[-1].eql?(@message.body[0])
  end
end
