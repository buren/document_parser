Rails.application.routes.draw do
  resource :documents, only: %i(create)
end
