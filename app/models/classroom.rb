class Classroom < ApplicationRecord
  ############## RELATIONS  #############
  belongs_to :level
  belongs_to :school
  belongs_to :user
  has_many :exercices,
            dependent: :destroy
  has_one :classroom_admin,
          dependent: :delete# d'abord une classe a un admin

############## VALIDADTIONS  #############

validates_with ClassroomValidator
validates :name, 
:slug, 
:user_id, 
:school_id,
:level_id,  presence: true


############## SLUG #############
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
