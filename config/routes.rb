Rails.application.routes.draw do
  get '/ping' => lambda { |env| [200, { 'Content-Type' => 'application/json' }, ['Pong']] }

  namespace :api do
    namespace :v0 do
      resources :tour_agents, except: %i[new edit index] do
        scope module: :tour_agents do
          resources :tours, except: %i[new edit]
          resources :conversations, only: %i[index create]
        end
      end

      resources :customers, only: %i[] do
        scope module: :customers do
          # resources :tours, only: %i[show index]
          resources :messages, only: %i[create]
          resources :conversations, only: %i[index show]
        end
      end

      resources :messages, only: %i[index create]
<<<<<<< HEAD
      resources :customers, only: %i[show]

      resources :tours, only: %i[index show] do
=======

      resources :tours, only: %i[] do
>>>>>>> 73af6dbb44465bee73e2cdbce6b7dc09f5f649ee
        scope module: :customers do
          resources :ratings, only: %i[create index]
        end
      end
    end
  end
end
