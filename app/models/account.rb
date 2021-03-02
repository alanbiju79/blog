class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :first_name, :last_name, :username

  has_many :posts
  has_many :publications, through: :subscriptions

  def full_name
    "#{first_name} #{last_name}"
  end

end
