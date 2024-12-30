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

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "categories#index"
end