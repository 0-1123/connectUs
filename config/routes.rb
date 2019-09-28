Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'berufe', to: 'jobs#index', as: :jobs_index
  get 'beruf/:id', to: 'jobs#show', as: :job
  get 'firma/:id', to: 'jobs#company_show', as: :company
  get    "jobs/new",      to: "jobs#new"
  post   "jobs",          to: "jobs#create"
  get    "jobs/:id/edit", to: "jobs#edit", as: :edit_job
  patch  "beruf/:id",      to: "jobs#update", as: :beruf
  get "jobs/:id/archiv",      to: "jobs#archiv_job", as: :archiv_job
  get "jobs/:id/active",      to: "jobs#active_job", as: :active_job
  get "archiv",      to: "jobs#archiv", as: :archiv
  get 'anzeigen', to: 'jobs#anzeigen_show', as: :anzeigen
  get 'information', to: 'jobs#information', as: :information
  get "connections/:id/new", to: "connections#new", as: :new_connection
  get "anfragen", to: "connections#show", as: :connections
end
