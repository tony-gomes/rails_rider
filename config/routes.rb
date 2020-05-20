Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/:resource/find', to: 'search#show'

      resources :merchants, except: [:new, :edit]
      get '/merchants/:id/items', to: 'merchants#all_items'

      scope module: 'merchants' do
        resources :items, except: [:new, :edit]
        get '/items/:id/merchant', to: 'items#item_merchant'
      end
    end
  end
end
