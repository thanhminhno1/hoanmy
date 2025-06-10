class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :department
  has_many :partiant_trackings, dependent: :destroy
  enum :role, { admin: "admin", normal: "normal" }, default: :normal
end
