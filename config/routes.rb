Curriculum::Application.routes.draw do
     root :to => 'vacants#index'

     post "avaliable/finalization" => "avaliables#finalization"
     post "avaliable/" => "avaliables#index"
     post "autenticar/login" => "login#login"

     get "vacants/avaliable" => "vacants#vacants_avaliable"
     get "cadastro/" => "people#new"
     get "autenticar/" => "login#login"
     get "avaliable/" => "avaliables#index", as: :show_avaliable
     get "SkillLevel/inscrition/:id" => "SkillLevels#index", as: :show_inscrition
     get "vacants/edit/:id" => "vacants#edit"
     get "vacants/index" => "vacants#index"
     get "vacants/show/:id" => "vacants#show"

     resources :people
     resources :skill_level
     resources :vacants , only:[:index,:new,:create,:edit,:update,:vacants_avaliable,:show]
     resources :essays
     resources :skills
     resources :levels
     resources :users

 namespace :admin do
    get 'people/getcustomer/:id' => "people#getcustomer"
    post "/vacants/filled_filter" =>"vacants#filled_filter"
    get "vacants/filled" => "vacants#filled"
    get "vacants/vacant_avaliable" => "vacants#vacants_avaliable"
    get "skills_level/inscrition" => "'skill_level#inscrition"
    get "login/login" =>"login#login"
    get "login/logout" =>"login#logout"
    post "login/logout" =>"login#logout"
    post "/people/status" => "people#status"

    match "/autenticar/" => "/login/#login"
    match "/sair/" => "login#logout"
    get "skills_level/new"  => 'SkillLevel#new', as: :new_skill_level

    post "login/login" =>"login#login"
    post "people/avaliable" => "people#avaliable"

    resources :skill_level
    resources :vacants
    resources :skills
    resources :essays
    resources :users
    resources :cities
    resources :states do
      member do
        get :cities
      end
    end
    get "/"=>"login#login"
    resources :levels
    resources :users
    resources :sectors
    resources :people

    resources :courses
    resources :universities

end

     get "login/login" =>"login#login"
     post "login/login" =>"login#login"
     get "login/logout" =>"login#logout"
     post "login/logout" =>"login#logout"


end
