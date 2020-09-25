Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :tour_agents, except: %i[new edit] do
        scope module: :tour_agents do
          resources :tours, except: %i[new edit]
        end
      end
    end
  end
end
