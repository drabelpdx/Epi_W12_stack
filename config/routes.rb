Rails.application.routes.draw do
  get '/' => 'home#index'

  get "/log-in" => "sessions#new"
  post "/log-in" => "sessions#create"
  get "/log-out" => "sessions#destroy", as: :log_out

  resources :users do
    resources :questions
  end

  resources :questions do
      resources :answers
  end

end
