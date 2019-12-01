Rails.application.routes.draw do
  root "users#new"
  
  get "users/new", to: "users#new", as: "new_user"
  post "users/signin", to: "users#signin", as: "user_signin"
  post "users/create_it_user", to: "users#create_it_user", as: "create_it_user"
  post "users/create_change_user", to: "users#create_change_user", as: "create_change_user"
  delete "user/destroy", to: "users#destroy", as: "destroy_user"

  get "quiz/new", to: "quiz#new", as: "new_quiz"
  post "quiz/create", to: "quiz#create", as: "create_quiz"
  get "quiz/result", to: "quiz#result", as: "quiz_result"
  
  get "audit", to: "audit_questions#index", as: "audit"
  get "audit/:id", to: "audit_questions#show", as: "audit_question"
  
  get "questions", to: "quiz_questions#find_next_question", as: "find_next_question"
  get "questions/:id", to: "quiz_questions#ask", as: "ask_question"
  patch "questions/:id", to: "quiz_questions#answer", as: "answer_question"

  get "stats", to: "stats#index", as: "stats"
  get "charts/team_stats", to: "charts#team_stats", as: "team_stats_charts"

  get "winner_detector/people", to: "winner_detector#people", as: "detect_winning_people"
  get "winner_detector/team", to: "winner_detector#team", as: "detect_winning_team"
end
