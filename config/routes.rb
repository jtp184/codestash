Rails.application.routes.draw do
  get 'code_lookup/lookup'

  post 'code_lookup/upload'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
