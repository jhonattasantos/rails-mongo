Rails.application.routes.draw do
  resources :users do
    member do
      get 'download_pdf_document'
    end
  end
  root 'users#index'
end
