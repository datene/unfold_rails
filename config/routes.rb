Rails.application.routes.draw do

  if Rails.env.production?
    devise_for :users, :controllers => { :registrations => "users#registrations" } 
  else
    devise_for :users
  end

  root to: 'homes#show'


  get '/why', to: 'pages#why'
  get '/what', to: 'pages#what'
  get '/how', to: 'pages#how'
  get '/contact', to: 'pages#contact'


  get '/about', to: 'featured_users#index'
  post '/about', to: 'featured_users#create'
  get '/about/edit', to: 'featured_users#edit'
  patch '/about/update', to: 'featured_users#update'
  delete '/about/destroy', to: 'featured_users#destroy'

  get '/home/edit', to: 'homes#edit'
  patch '/home/update', to: 'homes#update'

  get '/blog', to: 'blogs#show'
  get '/blog/edit', to: 'blogs#edit'
  patch '/blog/update', to: 'blogs#update'

  get '/gifmemore', to: 'giphies#show'
  post '/gifmemore', to: 'giphies#create'
  get '/gifmemore/edit', to: 'giphies#edit'
  patch '/gifmemore/update', to: 'giphies#update'
  delete '/gifmemore/destroy', to: 'giphies#destroy'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
