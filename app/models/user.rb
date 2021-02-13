class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :userStocks
  has_many :stocks,through: :userStocks
  has_many :friendships
  has_many :friends, through: :friendships
  
  def is_a_friend?(user)
    self.friends.include?(user)
  end

  def self.search(search_string)
    users_arr = (User.where("name LIKE ?","%#{search_string}%")+User.where("email LIKE ?","%#{search_string}%")).uniq
  end
end
