class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable

  after_create :send_welcome_email

  def send_welcome_email
    UserMailer.user_welcome_email(self).deliver
  end

  has_many :books,dependent: :destroy
  has_many :favorites,dependent: :destroy
  has_many :book_comments,dependent: :destroy
  has_many :relationships,dependent: :destroy
  has_many :chats,dependent: :destroy
  has_many :user_rooms,dependent: :destroy
  has_many :rooms, through: :user_rooms
  attachment :profile_image, destroy: false

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, length: {maximum: 20, minimum: 2}
  validates :introduction, length: {maximum: 50}
  def followed_by?(user,follower)
    Relationship.where(user_id: user.id,follower_id: follower.id).exists?
  end

  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end