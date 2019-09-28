Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'berufe', to: 'jobs#index', as: :jobs_index
  get 'beruf/:id', to: 'jobs#show', as: :job
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
