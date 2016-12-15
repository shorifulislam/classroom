namespace :ring_end_of_class do
  desc "ring the end of class"
  task :ring do
    ActionCable.server.broadcast "end_class_channel", Time.now
  end
end
