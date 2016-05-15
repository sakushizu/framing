class Post < ActiveRecord::Base

  has_many :favorites
  belongs_to :user
  has_many :comments

  mount_uploader :image, ImageUploader

  acts_as_taggable_on :labels # post.label_list が追加される
  acts_as_taggable            # acts_as_taggable_on :tags のエイリアス

  def favorite_user(user_id)
   favorites.find_by(user_id: user_id)
  end
end
