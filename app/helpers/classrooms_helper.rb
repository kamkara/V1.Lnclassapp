module ClassroomsHelper

    #student_results_count
    def student_results_count(exercice)
        result_count = exercice.results.count
        result_count == 1 ? stub = "1 élève à Traité" : stub = "#{result_count} Elèves ont traités "
        return "#{stub} l'exercice."
    end


    
end
