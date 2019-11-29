class Statistics
    attr_reader :user_position, :leaderboard, :completed_quizzes, :inprogress_quizzes
    
    def initialize(user)
        @user = user
    end
    
    def compute
        q = "users.id as user_id,
            users.name as username,
            quizzes.score as score, 
            (quizzes.end_time - quizzes.start_time) as time"
        results = Quiz
                    .joins(:user)
                    .select(q)
                    .order(score: :desc, time: :asc)
        @user_position = results.map(&:user_id).index(@user.id) + 1 if @user
        @leaderboard = results.take(7).map { |result| result.username }
        @completed_quizzes = Quiz.where("end_time is not null").count
        @inprogress_quizzes = Quiz.all.count - @completed_quizzes
        self
    end
end