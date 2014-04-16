class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [ :login ]

  has_attached_file :avatar, styles: { medium: '200x250>', thumb: '100x125>', large: '50x63>'},
                    default_url: '/assets/DefaultImage_:style.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_one  :contact_info, as: :info_for
  has_many :schools, foreign_key: 'creator_id'

  accepts_nested_attributes_for :contact_info

  validates :login, presence: true, uniqueness: true, format: { with: /\A[a-z]*\z/i, message: 'should not have spaces' }
  validates :email, presence: true, uniqueness:true, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/,
                                                                message: 'the wrong format' }, if: 'self.email.present?'
  validates :birthday, presence: true
  validates :role, presence: true

  before_create :create_login

  def full_name
    "#{last_name} #{first_name} #{second_name}"
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

  def self.find_for_database_authentication(conditions)
    self.where(login: conditions[:login]).first || self.where(email: conditions[:email]).first
  end
end

