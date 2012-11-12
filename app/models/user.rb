class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :about, :address, :birthday, :city, :country, :first_name,
                  :last_name, :level, :second_name, :sex, :status, :weight,
                  :login

  belongs_to :group
  belongs_to :list_registration
  belongs_to :role
  belongs_to :team

  has_many :user_school_relations
  has_many :schools, :through => :user_school_relations
  has_many :contact_infos, :as => :info_for
  has_many :honors, :as => :item
  has_many :duels, :as => :fighter
  has_many :comments
  has_many :posts

  validates :login, :presence => true, :uniqueness => true, :format => {:with => /^[a[\S]z]+$/i, :message => "should not have spaces"},
            :if => "self.login.present?"

  before_create :create_login

  def full_name
    "#{last_name} #{first_name} #{second_name}"
  end

  def user_contact_info(info)
    contact_infos.first.send(info).pluck(:body).join(', ')  #выгребает для одного пользователя
    #Email.where("contact_info_id = ?", ContactInfo.find(User.first.contact_infos)).pluck(:body) #выгребает для всех пользователей
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

