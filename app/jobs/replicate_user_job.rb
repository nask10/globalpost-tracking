class ReplicateUserJob < ApplicationJob
  queue_as :default

  def perform(email, password)
    GlobalPost::HTTP.create_user(email, password)
  end
end
