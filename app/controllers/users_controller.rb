class UsersController < ApplicationController
    skip_before_action :ensure_user_signed_up, except: [:destroy]

    def signin
        respond_to do |format|
            @user = User.find_by_name(user_params[:code])
            if @user
                session[:user_id] = @user.id
                format.html { redirect_to stats_path }
            else
                format.html { redirect_to new_user_path, 
                    alert: "The code supplied at #{Time.now.strftime('%T')} is invalid. Please try again."}
            end
        end
    end

    def new
    end

    def create_change_user
        create_user("Change")
    end

    def create_it_user
        create_user("IT")
    end

    def destroy
        respond_to do |format|
            session[:user_id] = nil
            @quiz.destroy if @quiz
            @user.destroy if @user

            format.html { redirect_to new_user_path }

            helpers.broadcast_user_stats
            helpers.broadcast_quiz_info
            helpers.broadcast_team_stats
        end
    end

    private

    def create_user(team)
        respond_to do |format|
            User.transaction do
                user = User.create(team: team)
                session[:user_id] = user.id
                user.name = Moniker.find(user.id).name
                if user.save
                    format.html { redirect_to new_quiz_path }
                    helpers.broadcast_quiz_info
                end
            end
        end
    end

    def user_params
        params.fetch(:user, {}).permit(:code, :team)
    end
end