class AdminUser < ActiveRecord::Base

  devise :database_authenticatable,:recoverable, :rememberable,
         :trackable, :validatable, :authentication_keys => [ :name ]

end
