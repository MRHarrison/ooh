Oohlive::Application.routes.draw do
      

  resources :photos do
    collection do
      get :untouched
      post :edit_multiple
      put :update_multiple
      get :upload
      get :scan
    end
  end
  resources :albums do
    collection do
      get :untouched
    end
    resources :tags do
      resources :photos do
        collection do
          get :untouched
          get :upload
          get :edit_multiple
        end
      end
    end
    resources :photos do
      collection do
        get :untouched
        get :upload
        get :edit_multiple
      end
    end
  end
  resources :collections do
    resources :albums do
      resources :photos do
        collection do
          get :untouched
          get :upload
          get :edit_multiple
        end
      end
    end
  end
  
  resources :tags, :shallow => true do
    resources :photos
    resources :albums
  end



  resources :messages

  resources :preregisters

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :relationships, :only => [:create, :destroy]
  
  resources :users do
    member do
      get :following, :followers
    end
  end

  match '/about', :to => "pages#about"
  
    match '/test', :to => "pages#test"
  
  match '/edit', :to => "users#edit"

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
  root :to => "pages#home"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
