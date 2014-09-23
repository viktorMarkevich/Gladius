class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :invitable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [ :login ]

  has_one :image, dependent: :destroy
  has_one  :contact_info, as: :info_for, dependent: :destroy
  has_many :schools, foreign_key: 'creator_id'
  has_many :articles, foreign_key: 'author_id'

  accepts_nested_attributes_for :contact_info, update_only: true
  accepts_nested_attributes_for :image

  validates :login, uniqueness: true, format: { with: /\A[a-z0-9_-]*\z/i, message: 'should not have spaces' },
                                                                unless: :check_kind?
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                                                                message: 'the wrong format' }
  validates :role, presence: true

  before_create :create_login

  def full_name
    "#{first_name} #{last_name}"
  end

  def check_kind?
    self.kind == 'Member'
  end

  protected

  def create_login
    email = self.email.split(/@/)
    login_taken = User.where( login: email[0]).first
    unless login_taken
      self.login = email[0]
    else
      self.login = self.email
    end
  end
end

