Lammerjappen::Application.routes.draw do
  resources :documents
  
  match 'documents/:id/download' => 'documents#download', :as => 'download'
  match 'documents/:id/free' => 'documents#free', :as => 'free'
  match 'documents/:id/assign/:userid' => 'documents#assign', :as => 'assign'
  
  root :to => 'documents#index'
  
end
