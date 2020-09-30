Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :tour_agents, except: %i[new edit] do
        scope module: :tour_agents do
          resources :tours, except: %i[new edit]
        end
      end

      scope module: :customers do
        resources :tours, only: %i[show index]
      end
    end
  end
end
