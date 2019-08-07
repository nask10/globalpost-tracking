class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :email, type: String
  field :encrypted_password, type: String
  field :reset_password_token, type: String
  field :reset_password_sent_at, type: DateTime
  field :remember_created_at, type: DateTime
  field :created_at, type: DateTime
  field :updated_at, type: DateTime
  field :admin, type: Boolean

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
