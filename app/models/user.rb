class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, authentication_keys:[:logged]

  has_many :questions
  has_many :materials
  has_many :levels
  has_many :courses
  has_many :schools
  has_many :classrooms
  has_many :exercices
  has_many :results
  
  
  attr_writer :logged

  
  ################## VALIDATES  ###############
   before_validation :user_student?
   
   
   validates :first_name, :last_name, :full_name, :email, :password,
              :city, :contact, :role, presence: true

   validates :full_name,presence: true,
              format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ },
              length: { minimum:5, maximum: 30,
              message: "%{value} verifier votre nom complet"}

   validates :contact, uniqueness: true, numericality: { only_integer: true }, length: { minimum:10,
              message: "%{ value} verifier votre nom numéro est 10 chiffres"}
              
   validates :role, inclusion: { in: %w(Student Teacher Team),
                    message: "%{value} acces non identifier" }
   
  
  
   ############# CUSTOMIZE ###############""
   
   def user_student?
    if self.role == "Student"
      self.email = "#{self.matricule}@gmail.com" # if user.role == "Student"
      self.password = "#{self.contact}"
        
    end    
  end

  def full_name
    self.full_name = "#{self.first_name} #{self.last_name}" 
  end  
  
  def slug
    self.slug = self.full_name
  end

  ################## SLUG ###############
  extend FriendlyId
  friendly_id :full_name, use: :slugged
  
  def should_generate_new_friendly_id?
    full_name_changed?
  end

  ################## BEFORE SAVE  #########
  before_save do
  self.contact      = contact.strip.squeeze(" ")
  self.first_name         = first_name.strip.squeeze(" ").downcase.capitalize
  self.last_name          = last_name.strip.squeeze(" ").downcase.capitalize
  self.city               = city.strip.squeeze(" ").downcase.capitalize
end




  ################## LOGGED  #########
   
  def logged
    @logged || self.matricule || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if logged = conditions.delete(:logged)
      where(conditions.to_h).where(["lower(matricule) = :value OR lower(email) = :value", { :value => logged.downcase }]).first
    elsif conditions.has_key?(:matricule) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
