Rails.application.routes.draw do
  resources :responses
  resources :answers
  resources :questions
  resources :to_buy_lists
  resources :user_books
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
