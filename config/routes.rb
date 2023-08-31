Rails.application.routes.draw do
  get 'about/index'
  get 'home/index'
  get 'service/index'
  get 'contact/index'
  get 'footer/_footer'
  get 'shared/_navbar'
  resources :photographs, only: [:index, :show, :new, :create]
  
  resources :photographs do
    resources :comments, only: [:create, :destroy]
    member do
      put :like
    end
  end

  devise_for :users , controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  root 'home#index'
end
