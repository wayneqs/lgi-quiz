class Statistics
    attr_reader :user_position, :leaderboard, :completed_quizzes, :inprogress_quizzes
    
    def initialize(user)
        @user = user
        @leaderboard = Leaderboard.new
    end
    
    def compute
        @leaderboard.compute
        @user_position = @leaderboard.find_place(@user.id) if @user
        @completed_quizzes = Quiz.where("end_time is not null").count
        @inprogress_quizzes = Quiz.all.count - @completed_quizzes
        self
    end
end