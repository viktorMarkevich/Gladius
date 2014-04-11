class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [ :login ]

  has_attached_file :avatar, :styles => { :medium => "200x250>", :thumb => "100x125>", :large => "50x63>"},
                    :default_url => '/assets/DefaultImage_:style.png'

  belongs_to :group
  belongs_to :list_registration
  belongs_to :team

  has_one  :contact_info, :as => :info_for
  has_many :honors, :as => :item
  has_many :duels, :as => :fighter
  has_many :comments
  has_many :posts
  has_many :user_school_relations, :foreign_key => "member_id"
  has_many :schools, :through => :user_school_relations
  has_many :schools, :foreign_key => "creator_id"

  accepts_nested_attributes_for :contact_info, :user_school_relations

  # validates :login, :presence => true, :uniqueness => true, :format => {:with => /^[a[\S]z]+$/i, :message => "should not have spaces"},
  #          :if => "self.login.present?"
  validates :login, :presence => true, :uniqueness => true, :if => "self.login.present?"
  before_create :create_login

  def full_name
    "#{last_name} #{first_name} #{second_name}"
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

