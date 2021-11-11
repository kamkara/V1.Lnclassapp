class ExerciceValidator < ActiveModel::Validator
    def validate(record)
        unless record.classroom.exercices.none? {|q| q.name == record.name}
            record.errors[:exercice] << "Quiz already exists for #{record.classroom.name}"
        end
    end
end