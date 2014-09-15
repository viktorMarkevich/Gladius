class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseInvitable::Inviter

  has_many :articles, foreign_key: :admin_author_id, dependent: :destroy
end
