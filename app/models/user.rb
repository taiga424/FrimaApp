class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :items
  validates :nickname, presence: true
  validates :encrypted_password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :furigana_first, presence: true
  validates :furigana_last, presence: true
  validates :birthdate, presence: true
  validates :password, presence: true, length: { maximum: 7 }

end

