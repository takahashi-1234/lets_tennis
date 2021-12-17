Rails.application.routes.draw do
  devise_for :admins,skip:[:registrations,:passwords],controllers:{
    sessions:"admin/sessions"
  }
  devise_for :customers,skip:[:passwords],controllers:{
    registrations:"public/registrations",
    sessions:"public/sessions"
  }
  root to:"public/courts#index"
  
  namespace:admin do
    root to:"reports#index"
    resources:courts,except:[:new,:create,:index]
    resources:reports,only:[:edit,:update]
    resources:customer,except:[:new,:create,:destroy]
  end
  scope module: :public do
    resources:courts,except:[:update,:edit,:destroy,:index] do
      resources:comments,only:[:create,:destroy]
      resources:favorites,only:[:create,:destroy]
      resources:reports,only:[:create]
    end
    get "/customers/favoritecourts"=>"customers#favorite_courts",as:"favorite_courts"
    resources:customers,only:[:show,:edit,:update]
    resources:circles do
      resources:circle_favorites,only:[:create,:destroy]
      resources:reviews,only:[:create,:destroy]
      resources:events,except:[:index,:edit,:update]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
