class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  after_create :replicate_user
  
  def replicate_user
    Rails.logger.info "[Background job :: Replicating user..."
    ReplicateUserJob.perform_later(self.id)
  end
end
