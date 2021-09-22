Rails.application.routes.draw do
  resources :departamentos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :produtos, only: [:new, :create, :destroy, :edit]
  get "/produtos/busca" => "produtos#busca", as: :busca_produto
  root "produtos#index"
end
