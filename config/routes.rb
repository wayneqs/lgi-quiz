Rails.application.routes.draw do
  root "welcome#index", as: "welcome_index"
  get "users/new", as: "new_user"
  post "users/create_it_user", as: "create_it_user"
  post "users/create_change_user", as: "create_change_user"
  delete "user/destroy", as: "user_destroy"
  get "quiz/new", as: "new_quiz"
end
