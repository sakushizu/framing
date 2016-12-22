class Post < ActiveRecord::Base

  belongs_to :user
  has_many :favorites, dependent: :delete_all
  has_many :comments, dependent: :delete_all

  mount_uploader :image, ImageUploader

  validates_presence_of \
    :title,
    :description,
    :image

  acts_as_taggable_on :labels
  acts_as_taggable

  def favorite_user(user_id)
   favorites.find_by(user_id: user_id)
  end
end
