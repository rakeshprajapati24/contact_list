Rails.application.routes.draw do
  root 'contacts#index'
  resources :contacts
  get '/search' => 'contacts#search', :as => :search
  get '/show_contact' => 'contacts#show_contact', :as => :show_contact
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
