class QuizStatistics
    attr_reader :completed, :remaining
    
    def compute
        quiz_stats = Quiz.connection
                        .select_all("select count(id) as total, 
                                    count(end_time) as completed 
                                    from quizzes").to_a
        @completed = quiz_stats[0]["completed"]
        @remaining = quiz_stats[0]["total"] - @completed
        self
    end
end