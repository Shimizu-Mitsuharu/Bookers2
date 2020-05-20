class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many  :books, dependent: :destroy
  validates :name, presence: true,length: {in: 2..20} #追記
  validates :profile, length: { maximum: 50 } #追記
  attachment :profile_image
end
