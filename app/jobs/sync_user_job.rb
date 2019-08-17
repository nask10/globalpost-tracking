class SyncUserJob < ApplicationJob
  queue_as :default

  def perform(user_id, email, password)
    GlobalPost::HTTP.sync_user(user_id, email, password)
  end
end
