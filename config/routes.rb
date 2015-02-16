Rails.application.routes.draw do
 
 
  resources :suggestions

 #get 'propositions/list' => 'propositions#list'
  resources :propositions do
 member do
   get :like
   get :unlike
 end
end
  resources :propositions

  root to: "pages#homepage"
  get 'pages/homepage'
  
  
end
