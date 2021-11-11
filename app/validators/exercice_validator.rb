class ExerciceValidator < ActiveModel::Validator
    def validate(record)
        unless record.classroom.exercices.none? {|q| q.name == record.name}
         record.errors[:exercice] << "Exercice existe déja sur la plateforme #{record.classroom.name}"
        end
    end
end

