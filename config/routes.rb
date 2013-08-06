Curriculum::Application.routes.draw do

  resources :users

  resources :cities

  resources :states do
    member do
      get :cities
    end
  end

  resources :essays

  resources :levels

  resources :skills

  get "vacants/vacant_avaliable" => "vacants#vacants_avaliable"
  get "skills_level/inscrition" => "'skill_level#inscrition"

  resources :vacants

  get "login/login"
  post "login/login"
  get "login/logout"
  post "login/logout"

  get "indexpub" => "people#indexpub"

  match "autenticar" => "login/login#login"
  match "sair" => "login#logout"

  resources :skill_level
  get "skills_level/new"  => 'SkillLevel#new', as: :new_skill_level

  resources :users

  resources :sectors

  resources :people

  resources :courses

  resources :universities

 namespace :curriculum do
     resources :people
     get "vacants/avaliable" => "vacants#vacants_avaliable"
     get "SkillLevel/inscrition/:id" => "SkillLevel#index"
     resources :skill_level
     resources :vacants , only:[:index,:new,:create,:edit,:update,:vacants_avaliable,:show]
     get "vacants/edit/:id" => "vacants#edit"
     get "vacants/index" => "vacants#index"
     get "vacants/show/:id" => "vacants#show"

 end


 #get "vacants/teste" => "vacants#teste"
  root :to => 'login#login'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

end
