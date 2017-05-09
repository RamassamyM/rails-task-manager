Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tasks
  root to: 'tasks#index'

  patch 'tasks/:id/done' => 'tasks#mark_as_done', as: 'mark'
end
