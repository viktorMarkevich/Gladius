class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [ :login ]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :about, :birthday, :first_name, :last_name, :level, :second_name,
                  :sex, :status, :weight, :login, :contact_info_attributes, :avatar,
                  :school_id, :role

  has_attached_file :avatar, :styles => { :medium => "200x250>", :thumb => "100x125>", :large => "50x63>"},
                    :default_url => '/assets/DefaultImage_:style.png'

  belongs_to :group
  belongs_to :list_registration
  belongs_to :team
  belongs_to :school, :counter_cache => true

  has_one  :contact_info, :as => :info_for
  has_many :honors, :as => :item
  has_many :duels, :as => :fighter
  has_many :comments
  has_many :posts

  accepts_nested_attributes_for :contact_info

  validates :login, :presence => true, :uniqueness => true, :format => {:with => /^[a[\S]z]+$/i, :message => "should not have spaces"},
            :if => "self.login.present?"

  before_create :create_login

  ROLES = %w(manager moderator pupil admin fighter)
  STATUS = %w(student sifu trainer)
  LEVEL = %w(0 1 2 3 4 5 6) # это частный случай

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  def full_name
    "#{last_name} #{first_name} #{second_name}"
  end

  def user_contact_info(info)
    contact_info.send(info).pluck(:body).join(', ')
  end

  protected

  def create_login
    email = self.email.split(/@/)
    login_taken = User.where( :login => email[0]).first
    unless login_taken
      self.login = email[0]
    else
      self.login = self.email
    end
  end

  def self.find_for_database_authentication(conditions)
    self.where(:login => conditions[:login]).first || self.where(:email => conditions[:email]).first
  end
end

