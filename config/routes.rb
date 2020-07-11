Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items
      resources :customers
      resources :invoice_items
      resources :merchants
      resources :invoices
      resources :transactions
      get "/merchants/:id/items", to: 'merchant_items#index'
      get "/items/:id/merchant", to: 'merchant_item#show'
      get "/:resource/find", to: 'search#show'
    end
  end
end
