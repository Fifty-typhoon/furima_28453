class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :email   # uniqueness: true
    validates :encrypted_password, length: { minimum: 6 }
    validates :nickname
    validates :first_name
    validates :last_name
    validates :kana_first_name
    validates :kana_last_name
    validates :birthday
  end

  has_many :items
  has_many :purchases

  EMAIL_REGEX = /@.+/.freeze
  validates_format_of :email, with: EMAIL_REGEX
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  NAME = /[ぁ-んァ-ン一-龥]/.freeze
  validates_format_of :first_name, with: NAME
  validates_format_of :last_name, with: NAME
  KANA_NAME = /[ァ-ン]/.freeze
  validates_format_of :kana_first_name, with: KANA_NAME
  validates_format_of :kana_last_name, with: KANA_NAME
end
