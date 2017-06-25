Rails.application.routes.draw do
  get '/', to: redirect('https://github.com/buren/document_parser')

  resource :documents, only: %i(create)
end
