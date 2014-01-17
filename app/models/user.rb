class User < ActiveRecord::Base
  validates_presence_of :username

  validates_uniqueness_of :username,
    case_sensitive: false
    has_many :planets
    has_many :ratings
    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
