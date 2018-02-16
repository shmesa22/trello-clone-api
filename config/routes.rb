Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope "(:locale)", locale: /es|en/ do
    namespace :api, defaults: {format: :json} do
    end
  end
end
