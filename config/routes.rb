Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace 'api' do
    namespace 'v1' do
      resources :books
      delete '/delete_all', to: 'books#delete_all'
      get 'types/index', to: 'types#index'
      get '/pages', to: 'books#get_number_of_pages'
    end
  end
end
