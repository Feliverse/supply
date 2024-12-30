Rails.application.routes.draw do
  resources :categories do 
    resources :subcategories do 
      resources :marcas do
        resources :teches do
          resources :products
        end
      end
    end
  end

  resources :products

  # Define the root path route ("/")
  root "categories#index"
end