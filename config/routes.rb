Rails.application.routes.draw do
  resources :responses
  resources :answers
  resources :questions
  resources :to_buy_lists
  resources :user_books
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'signup', to: 'users#create', as: 'signup'

  post 'authenticate', to: 'users#authenticate', as: 'authenticate'

  # get 'questions' to: 'questions#index' as: 'questions'

  # post 'responses', to: 'responses#create' as: 'responses'
  
end
