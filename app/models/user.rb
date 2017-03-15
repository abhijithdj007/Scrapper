class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :recoverable, , :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable, :rememberable
  
  has_many :user_domain_scraps

end
