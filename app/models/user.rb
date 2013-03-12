class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable,
    :validatable, :confirmable
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :email, :password, :admin, :as => :admin
  has_many :permissions
  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end
end
