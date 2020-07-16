Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/most_items', to: 'items#index'
        get '/most_revenue', to: 'revenue#index'
        get 'revenue', to: 'revenue#show'
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
      get '/revenue', to: 'revenue#index'
    end
  end
end
