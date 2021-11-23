module ClassroomsHelper
    #student_results_count
    def student_results_count(exercice)
        result_count = exercice.results.count
        result_count == 1 ? stub = "1 élève à Traité" : stub = "#{result_count} Elèves ont traités "
        return "#{stub} l'exercice."
    end

    def unattempted_exercices(classroom, user)
        classroom.exercices.ready.filter do |q| 
            !q.results.find_by(user: user)
        end
    end

    def finished_exercices(classroom, user)
        classroom.exercices.ready.filter do |q| 
            q.results.find_by(user: user)
        end
    end
    
    def exercices_due(classroom)
     exercice_readed = classroom.exercices.ready.count 
     classroom_result = classroom.results.where(user: current_user).count
     exercice_readed - classroom_result
     classroom.exercices.ready.count - classroom.results.where(user: current_user).count
    end
end
