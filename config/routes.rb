Rails.application.routes.draw do

  root 'curriculo#index'
  #get 'curriculo/index', to: 'curriculo/index'
  #get '/contato', to: 'curriculo#contato'
  get '/eletronica', to: 'curriculo#eletronica'
  get '/software', to: 'curriculo#software'
  get '/software/fluxo-sanguineo', to: 'curriculo#fluxo_sanguineo'
  get '/software/projeto_icf', to: 'curriculo#projeto_icf'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :contacts, only: [:new, :create, :sendEmail]


  #root 'curriculo#index'

end
