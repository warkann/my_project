class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :recoverable,
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  validates_presence_of :nickname
  validates_uniqueness_of :nickname
end
