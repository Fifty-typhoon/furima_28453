class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

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
  has_many :sns_credentials
  has_many :comments

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

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
