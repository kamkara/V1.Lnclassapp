class ResultValidator < ActiveModel::Validator
    def validate(record)
        if record.user.results.where(exercice: record.exercice).any?
            record.errors[:name] << "Vous avec déja traiter l'exercice."
        end

        if record.answered_questions.any? {|aq| aq.answer_id.nil?}
            record.errors[:questions] << "You must answer every question before submitting."
        end
    end
end

