class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  # has_many :comments
  # validates :name, length:{maximum: 10}, presense: true
  validates_uniqueness_of :name
  validates_presence_of :name

end
