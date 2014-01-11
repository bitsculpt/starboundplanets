class User < ActiveRecord::Base
  validates_presence_of :username

  validates_uniqueness_of :username,
    case_sensitive: false

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
