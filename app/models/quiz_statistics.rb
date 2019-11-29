class QuizStatistics
    attr_reader :completed_quizzes, :inprogress_quizzes
    
    def compute
        @completed_quizzes = Quiz.where("end_time is not null").count
        @inprogress_quizzes = Quiz.all.count - @completed_quizzes
        self
    end
end