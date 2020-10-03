Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :tour_agents, except: %i[new edit] do
        scope module: :tour_agents do
          resources :tours, except: %i[new edit]
          resources :conversations, only: %i[index create]
        end
      end

      resources :customers, only: %i[] do
        scope module: :customers do
          resources :tours, only: %i[show index]
          resources :messages, only: %i[create]
          resources :conversations, only: %i[index]
        end
      end

      resources :messages, only: %i[index create]
    end
  end
end
