module ApplicationHelper
    def class_string(css_map)
        css_map.find_all(&:last).map(&:first).join(" ")
    end

    def active_if_on(pages)
        "active" if pages.any? {|p| current_page?(p)}
    end

    def broadcast_quiz_info
        quiz_stats = QuizStatistics.new.compute
        QuizStatisticsChannel.broadcast_stats(quiz_stats)
    end

    def broadcast_user_stats
        user_stats = UserStatistics.new.compute
        LeaderboardChannel.broadcast_leaderboard(user_stats.leaders)
    end

    def broadcast_team_stats
        TeamStatisticsChannel.broadcast_stats()
    end
end
