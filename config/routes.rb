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
  delete "jobs/:id",      to: "jobs#destroy"

  get 'anzeigen', to: 'jobs#anzeigen_show', as: :anzeigen
end
