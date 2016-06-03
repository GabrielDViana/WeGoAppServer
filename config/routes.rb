Rails.application.routes.draw do


  root 'users#show'
  post 'users/create' => 'users#create'
  get  'users/show'  => 'users#show'
  get  'users/login/:email'  => 'sessions#create', :constraints => { :email => /[^\/]+/ }
  post 'users/login/:email'  => 'sessions#create', :constraints => { :email => /[^\/]+/ }
  post 'users/follow' => 'relationships#create'
  post 'users/unfollow' => 'relationships#destroy'

  get  'login_twitter/:id_social'  => 'sessions#login_twitter'
  post 'login_twitter/:id_social'  => 'sessions#login_twitter'

  post 'password_reset/create' => 'password_reset#create'
  get  'password_reset/:key/edit'  => 'password_reset#edit', :constraints => { :email => /[^\/]+/ }
  patch  'password_reset/:key' => 'password_reset#update'

  get  'company/create'  => 'companies#create'
  post 'company/create'  => 'companies#create'
  get  'company/'  => 'companies#index'
  post 'company/rate' => 'ratings#create'
  get 'company/show/' => 'companies#show'

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
