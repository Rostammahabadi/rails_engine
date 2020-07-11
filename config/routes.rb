Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :items
      resources :customers
      resources :invoice_items
      resources :merchants
      resources :invoices
      resources :transactions
    end
  end
end
