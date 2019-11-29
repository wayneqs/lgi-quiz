class Leaderboard
    def initialize(this_many = 7)
        @this_many = this_many
        @leaders = []
    end

    attr_reader :leaders

    def compute
        q = "users.id as user_id,
            users.name as username,
            quizzes.score as score, 
            (quizzes.end_time - quizzes.start_time) as time"
        @results = Quiz
                    .joins(:user)
                    .select(q)
                    .order(score: :desc, time: :asc)        
        @leaders = @results.take(@this_many).map { |result| result.username }
        self
    end

    def find_place(user_id)
        compute unless @results # prefer cached
        (@results.map(&:user_id).index(user_id) + 1).ordinalize
    end
end