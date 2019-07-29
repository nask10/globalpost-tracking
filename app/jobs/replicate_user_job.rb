class ReplicateUserJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find user_id
    GlobalPost::HTTP.create_user(user)
  end
end
