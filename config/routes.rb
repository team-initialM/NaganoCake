Rails.application.routes.draw do
  devise_for :admins, only: :sessions, controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :customers, skip: :all
  devise_scope :customer do
    get 'customers/sign_in' => 'public/sessions#new', as: :new_customer_session
    post 'customers/sign_in' => 'public/sessions#create', as: :customer_session
    delete 'customers/sign_out' => 'public/sessions#destroy', as: :destroy_customer_session
    get 'customers/sign_up' => 'public/registrations#new', as: :new_customer_registration
    post 'customers' => 'public/registrations#create'
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about' => "homes#about"
    resources :shipping_addresses, only: [:index, :edit, :update, :create, :destroy]
    resources :products, only: [:index, :show]
    resources :cart_products, only: [:index, :update, :create, :destroy] do
      collection do
        delete 'destroy_all' => 'cart_products#destroy_all', as: 'destroy_all'
      end
    end
    resources :orders, only: [:new, :index, :create, :show] do
      collection do
        post 'confirm' => 'orders#confirm', as: 'confirm'
        get 'complete' => 'orders#complete', as: 'complete'
      end
    end
    resource :customers, only: [:edit, :update] do
      collection do
        patch 'withdraw' => 'customers#withdraw', as: 'withdraw'
        get 'unsubcribe' => 'customers#unsubcribe', as: 'unsubcribe'
        get 'my_page' => 'customers#show', as: 'show'
      end
    end
  end

  scope module: :admin do
    get '/admin' => "homes#top"
    resources :customers, only: [:index, :edit, :update, :show]
    resources :orders, only: [:update, :show] do
      resources :order_products, only: :update
    end
    resources :products, except: :destroy
    resources :genres, only: [:index, :update, :edit, :create]
  end

end
