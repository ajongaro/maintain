Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'main#index'
  resources :tasks, only:[:index, :new, :show, :create]
end
