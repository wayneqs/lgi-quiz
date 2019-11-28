Rails.application.routes.draw do
  root "welcome#index", as: "welcome_index"
  
  get "users/new", to: "users#new", as: "new_user"
  post "users/create_it_user", to: "users#create_it_user", as: "create_it_user"
  post "users/create_change_user", to: "users#create_change_user", as: "create_change_user"
  delete "user/destroy", to: "users#destroy", as: "user_destroy"

  get "quiz/new", to: "quiz#new", as: "new_quiz"
  post "quiz/create", to: "quiz#create", as: "create_quiz"
  get "quiz/result", to: "quiz#result", as: "quiz_result"

  get "questions", to: "quiz_questions#find_next_question", as: "find_next_question"
  get "questions/:id", to: "quiz_questions#ask", as: "ask_question"
  patch "questions/:id", to: "quiz_questions#answer", as: "answer_question"

  get "stats", to: "stats#index"
end
