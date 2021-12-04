module CoursesHelper
    #student_results_count
    def student_results_count(exercice)
        result_count = exercice.results.count
        result_count == 1 ? stub = "1 élève à Traité" : stub = "#{result_count} Elèves ont traités "
        return "#{stub} l'exercice."
    end

    def unattempted_exercices(course, user)
        course.exercices.ready.filter do |q| 
            !q.results.find_by(user: user)
        end
    end

    def finished_exercices(course, user)
        course.exercices.ready.filter do |q| 
            q.results.find_by(user: user)
        end
    end
    
    def exercices_due(course)
     exercice_readed = course.exercices.ready.count 
     course_result = course.results.where(user: current_user).count
     exercice_readed - course_result
     course.exercices.ready.count - course.results.where(user: current_user).count
    end
end
