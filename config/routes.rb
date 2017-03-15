Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "scrapper#index"
  
  post '/scrap_domain' => 'scrapper#scrap_domain', as: "scrap_domain"
end