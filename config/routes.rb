Rails.application.routes.draw do
  scope '/api' do
    scope '/v1' do
      resources :properties, except: %w(destroy update)
    end
  end
end
