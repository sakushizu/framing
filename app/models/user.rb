class User < ActiveRecord::Base

  has_many :favorites
  has_many :posts
  has_many :comments

  mount_uploader :image, ImageUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :timeoutable, :omniauthable, omniauth_providers: [:twitter, :facebook]

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    if auth.provider == 'facebook'
      unless user
        user = User.new(
          uid:      auth.uid,
          provider: auth.provider,
          username: auth.info.name,
          email:    User.dummy_email(auth),
          password: Devise.friendly_token[0, 20]
        )
        user.remote_image_url = auth.info.image.gsub('http://','https://')
        user.save
      end
    elsif auth.provider == 'twitter'
      unless user
        user = User.new(
          uid:      auth.uid,
          provider: auth.provider,
          username: auth.info.name,
          email:    User.dummy_email(auth),
          password: Devise.friendly_token[0, 20]
        )
        user.remote_image_url = auth.info.image.gsub('http://','https://')
        user.save
      end
    end
    user
  end

private
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

end
