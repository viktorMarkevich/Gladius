class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [ :login ]

  has_one  :contact_info, as: :info_for
  has_many :schools, foreign_key: 'creator_id'

  accepts_nested_attributes_for :contact_info

  has_attached_file :avatar, styles: { medium: '200x250>', thumb: '100x125>', large: '50x63>'},
                    default_url: '/assets/DefaultImage_:style.png'

  validates :login, uniqueness: true, format: { with: /\A[a-z]*\z/i, message: 'should not have spaces' }
  validates :email, presence: true, uniqueness:true, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/,
                                                                message: 'the wrong format' }, if: 'self.email.present?'
  validates :role, presence: true

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_size :avatar, less_than: 2.megabytes

  before_create :create_login

  def full_name
    "#{first_name} #{last_name}"
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

