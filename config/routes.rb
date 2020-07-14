Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
      end
      namespace :items do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
      end
      resources :items
      resources :customers
      resources :invoice_items
      resources :invoices
      resources :transactions
      resources :merchants
      get "/merchants/:id/items", to: 'merchant_items#index'
      get "/items/:id/merchant", to: 'merchant_item#show'
      get "/:resource/find", to: 'search#show'
    end
  end
end
