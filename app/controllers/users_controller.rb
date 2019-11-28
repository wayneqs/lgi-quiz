class UsersController < ApplicationController
    before_action :set_user, only: [:destroy]

    def new
    end

    def create_change_user
        create_user("Change")
    end

    def create_it_user
        create_user("IT")
    end

    def destroy
        session[:user_id] = nil
        @user.destroy
    end

    private

    def set_user
        @user = User.find(session[:user_id])
    end

    def create_user(team)
        User.transaction do
            @user = User.create(team: team)
            session[:user_id] = @user.id
            @user.name = Moniker.find(@user.id).name
            if @user.save
                redirect_to new_quiz_path
            end
        end
    end
end