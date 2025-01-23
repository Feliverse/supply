Rails.application.routes.draw do
  resources :inventarios
  resources :movimientos
  resources :calidads
  resources :articulos
  resources :almacens do
    member do
      get 'new_movimiento'
      get 'new_movimiento_producto'
      get 'new_movimiento_articulo'
      post 'create_movimiento'
    end
    resources :sales, only: [:new, :create]
    resources :inventarios, only: [:index], defaults: { format: :json }
  end
  resources :clientes do
    collection do
      get 'find_by_nit'
    end
  end
  resources :categories do 
    resources :subcategories
  end

  resources :products

  resources :marcas do
    resources :teches
  end

  resources :sales, only: [:index, :new, :create]

  # Define the root path route ("/")
  root "almacens#index"
end