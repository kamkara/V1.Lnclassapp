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
    
  #current user completed exercice
    def completed_by(user)
        results.any? {|r| r.user == user}
    end

    #current user grade
    def user_grade(user)
        results.where(user_id: user).first.grade()
    end

    #build result
    def build_result
        r = self.results.build()
        self.questions.each {|q| r.answered_questions.build(question: q)}
        return r
    end

  #SLUG
  extend FriendlyId
    friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    name_changed?
  end  
end
