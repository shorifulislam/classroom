# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class StudentsCounterChannel < ApplicationCable::Channel

  @@STUDENTS_COUNTER = 0
  def subscribed
    # stream_from "some_channel"


    #stream_from "StudentsCounterChannel"
    stream_from "some_channel"
    #increment counter
    @@STUDENTS_COUNTER += 1

    #broadcast (to move where it is called)
    broadcast_new_counter


  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed

    #decrement
    @@STUDENTS_COUNTER -= 1
    broadcast_new_counter

  end

  private

  def broadcast_new_counter
    ActionCable.server.broadcast "some_channel", @@STUDENTS_COUNTER
  end
end
