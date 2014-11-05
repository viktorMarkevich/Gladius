class Image < ActiveRecord::Base

  belongs_to :user
  belongs_to :member, foreign_key: 'user_id'

  has_attached_file :avatar, styles: { medium: '250x250>', thumb: '125x125>', large: '63x63>'},
                    default_url: '/assets/DefaultImage_:style.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_size :avatar, less_than: 2.megabytes
end
