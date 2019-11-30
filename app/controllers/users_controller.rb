class UsersController < ApplicationController
    skip_before_action :ensure_user_signed_up, except: [:destroy]

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

            format.html { redirect_to welcome_path }

            helpers.broadcast_user_stats
            helpers.broadcast_quiz_stats
        end
    end

    private

    def create_user(team)
        respond_to do |format|
            User.transaction do
                @user = User.create(team: team)
                session[:user_id] = @user.id
                @user.name = Moniker.find(@user.id).name
                if @user.save
                    format.html { redirect_to new_quiz_path }
                end
            end
        end
    end
end