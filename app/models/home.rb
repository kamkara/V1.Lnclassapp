class Home < ApplicationRecord
    #scope :student_content, -> { where(level_id = ?, 'current_user.level_id')} 
    #scope :teacher_content, -> { where(material_id = ?, 'current_user.material_id')}
end
