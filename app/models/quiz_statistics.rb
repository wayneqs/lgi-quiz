class QuizStatistics
    attr_reader :complete, :incomplete, :competitors
    
    def compute
        quiz_stats = Quiz.connection
                        .select_all("select 
                                        count(users.id) as competitors,
                                        count(end_time) as complete, 
                                        count(quizzes.id) as all 
                                    from users left outer join quizzes 
                                        on users.id = quizzes.user_id
                                    where users.is_admin = false;").to_a
        @complete = quiz_stats[0]["complete"]
        @incomplete = quiz_stats[0]["all"] - @complete
        @competitors = quiz_stats[0]["competitors"]
        self
    end
end