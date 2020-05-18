Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :merchants, except: [:new, :edit]
      get '/merchants/:id/items', to: 'merchants#all_items'
      scope module: 'merchants' do
        resources :items, except: [:new, :edit]
      end
    end
  end
end
