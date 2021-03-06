Rails.application.routes.draw do

  resources :tasks, except: :new

  resources :applications, except: :new

  resources :contacts

  resources :jobs

  resources :companies

  get '/map', to: "welcome#map", as: :map
  
  get 'welcome/search', to: "welcome#search", as: :welcome_search
  
  get 'company/search', to: "companies#search", as: :company_search

  get 'job/search', to: "jobs#search", as: :job_search

  post 'company/create_from_linkedin', to: "companies#create_from_linkedin", as: :create_linkedin_company

  post 'job/create_from_linkedin', to: "jobs#create_from_linkedin", as: :create_linkedin_job

  get 'task/new/:application_id', to: "tasks#new", as: :new_task

  get 'application/new/:job_id', to: "applications#new", as: :new_application

  devise_for :users, controllers: { registrations: 'registrations' }

  root 'welcome#splash'

  get '/portal', to: "welcome#portal"

  devise_scope :user do
    get '/signin', to: 'devise/sessions#new'
    get '/register', to: 'devise/registrations#new'
  end

  resources :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
