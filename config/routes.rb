Rails.application.routes.draw do
  get 'searchs/search'

  devise_for :users, path: 'usuarios'
  resources :contacts, only: [:create], path: 'contato'
  resources :vehicles, path: 'veiculos'
  match '/admin/index', to: 'privates#index', via: [:get, :post]
  match '/admin/removeDestaque/:id', to: 'vehicles#removeDestaque', via: [:get]
  match '/admin/addDestaque/:id', to: 'vehicles#addDestaque', via: [:get]
  match '/admin/estoque', to: 'privates#estoque', via: [:get]
  match '/admin', to: 'privates#index', via: [:get]
  scope '/admin' do
    resources :models, path: 'modelos'
    resources :categories, path: 'categorias'
    resources :vehicles, path: 'veiculos'
  end
  match '/admin/modelos/autocomplete', to: 'models#autocomplete', via: [:get]
  match '/admin/categorias/autocomplete', to: 'categories#autocomplete', via: [:get]
  match '/contato', to: 'contacts#new', via: [:get]
  match '/sobre', to: 'publics#about', via: [:get]
  match '/admin/stock_option', to: 'privates#stock_or_new', via: [:get]
  match '/veiculos/:id', to: 'vehicles#show', via: [:get]
  match '/autocomplete', to: 'vehicles#autocomplete', via: [:get]
  match '/search', to: 'searchs#search', via: [:get]
  match '/promocoes', to: 'vehicles#offers', via: [:get]
  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]
  root 'vehicles#index'
end
