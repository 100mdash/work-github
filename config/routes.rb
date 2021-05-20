Rails.application.routes.draw do

  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}
   root 'homes#top'
   get 'homes/about' => 'homes#about'

  namespace :public do
    resources :items, only: [:index, :show]
    resource :customers, except: [:index, :new, :create, :destroy]
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/confilm' => 'orders#confilm'
    get 'orders/complete' => 'orders#complete'
    resources :addresses, except: [:new, :show]
    resources :shippings, except: [:new,:show]
    resources :cart_items, except: [:new, :show, :edit]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'

  end


  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  namespace :admin do
    root 'homes#top'
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, except: [:new, :create, :destroy]
    get 'orders/:id' => 'orders#show'
    patch 'orders/:id' => 'orders#update' do
      patch 'order_details/:id' => 'order_details#update'
    end

  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
