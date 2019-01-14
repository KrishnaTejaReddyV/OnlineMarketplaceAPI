Rails.application.routes.draw do
  get 'welcome/index'

  resources :users, except: [:new, :edit] do
    resources :products, except: [:new, :edit] do
      get 'available', on: :collection
      get 'addtocart', on: :member, controller: 'cart_items'
    end

    resources :cart_items, only: [:index, :show] do
      get 'complete', on: :collection
      get 'removefromcart', on: :member
    end

    resources :purchased_items, only: [:index, :show]
  end

  root 'welcome#index'
end
