class ExerciceValidator < ActiveModel::Validator
    def validate(record)
        unless record.course.exercices.none? {|q| q.name == record.name}
         record.errors[:exercice] << "Exercice existe déja sur la plateforme, mais vous pouvez changer de nom pour votre classe #{record.classroom.name}"
        end
    end
end

