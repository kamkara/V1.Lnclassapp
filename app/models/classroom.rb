class Classroom < ApplicationRecord
  belongs_to :level
  belongs_to :school
  belongs_to :user
  
  validates :name, 
            :slug, 
            :user_id, 
            :school_id,
            :level_id,  presence: true #:school_name_id,
 
 #SLUG
  extend FriendlyId
  friendly_id :slugged_custom, use: :slugged

  def should_generate_new_friendly_id?
    name_changed? || super
  end

  def slugged_custom
    #{school_name.nick_name} #
    "from #{name}"
  end
end
