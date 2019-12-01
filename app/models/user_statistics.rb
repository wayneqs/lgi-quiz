class UserStatistics
    def initialize(this_many = 7)
        @this_many = this_many.to_i
        @leaders = []
    end

    attr_reader :leaders

    def compute
        @leaders = Quiz.connection.select_all("select
                                                row_number() over(order by quizzes.score desc, 
                                                                    (quizzes.end_time - quizzes.start_time)
                                                            ) as position,
                                                users.id as user_id,
                                                users.name as username,
                                                quizzes.score as score
                                            from users inner join quizzes
                                                on users.id = quizzes.user_id
                                            order by position limit #{@this_many};").to_a      
        self
    end

    def find_place(user_id)
        compute unless @leaders # prefer cached
        leader = @leaders.detect {|leader| leader["user_id"] == user_id}
        leader["position"].ordinalize if leader
    end
end