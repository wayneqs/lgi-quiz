class QuizStatistics
    attr_reader :completed, :remaining, :competitors
    
    def compute
        quiz_stats = Quiz.connection
                        .select_all("select 
                                        count(users.id) as competitors,
                                        count(end_time) as completed, 
                                        count(quizzes.id) as all 
                                    from users left outer join quizzes 
                                        on users.id = quizzes.user_id;").to_a
        @completed = quiz_stats[0]["completed"]
        @remaining = quiz_stats[0]["all"] - @completed
        @competitors = quiz_stats[0]["competitors"]
        self
    end
end