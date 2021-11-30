class Exercice < ApplicationRecord
  scope :ready, -> { where("published == true")}
  scope :chrono, -> { order(created_at: :desc)}
   
  has_many :questions, dependent: :destroy
  belongs_to :user
  belongs_to :course
  has_many :results, dependent: :delete_all
  #has_many :notes
    
  validates_with ExerciceValidator, on: :create
  validates_with PublicationValidator, on: :update
    

  #SLUG
  extend FriendlyId
    friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    name_changed?
  end  
end
