Rails.application.routes.draw do
  devise_for :admins,skip:[:registrations,:passwords],controllers:{
    sessions:"admin/sessions"
  }
  devise_for :customers,skip:[:passwords],controllers:{
    registrations:"public/registrations",
    sessions:"public/sessions"
  }
  
  namespace:admin do
    root to:"reports#not_supported_reports"
    get "suported_reports" => "reports#supported_reports",as:"supported_reports"
    resources:courts,except:[:new,:create,:index]
    resources:reports,only:[:edit,:update]
    resources:customer,except:[:new,:create,:destroy]
  end
  scope module: :public do
    root to:"courts#index"
    resources:courts,except:[:update,:edit,:destroy,:index] do
      resources:comments,only:[:create,:destroy]
      resources:favorites,only:[:create,:destroy]
      resources:reports,only:[:create]
    end
    get "/customers/favoritecourts"=>"customers#favorite_courts",as:"favorite_courts"
    resources:customers,only:[:show,:edit,:update]do
      patch "/withdraw"=>"customers#withdraw",as:"withdraw"
    end
    resources:circles do
      resources:circle_favorites,only:[:create,:destroy]
      resources:reviews,only:[:create,:destroy]
      resources:events,except:[:index,:edit,:update]
      resources:chats,only:[:create,:show]
    end
    resources:rooms,only:[:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
