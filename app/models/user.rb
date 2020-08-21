class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true   #uniqueness: true
  validates :encrypted_password, presence: true, length: { maximum: 6 }
  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :kana_first_name, presence: true
  validates :kana_last_name, presence: true
  validates :birthday, presence: true

  EMAIL_REGEX = /@.+/.freeze
  validates_format_of :email, with:EMAIL_REGEX
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  FIRST_NAME = /[ぁ-んァ-ン一-龥]/.freeze
  validates_format_of :first_name, with: FIRST_NAME
  LAST_NAME = /[ぁ-んァ-ン一-龥]/.freeze
  validates_format_of :last_name, with: LAST_NAME
  KANA_FIRST_NAME = /[ァ-ン]/.freeze
  validates_format_of :kana_first_name, with: KANA_FIRST_NAME
  KANA_LAST_NAME = /[ァ-ン]/.freeze
  validates_format_of :kana_last_name, with: KANA_LAST_NAME

end
