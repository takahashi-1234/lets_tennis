Rails.application.routes.draw do
  devise_for :admins,skip:[:registrations,:passwords],controllers:{
    sessions:"admin/sessions"
  }
  devise_for :customers,skip:[:passwords],controllers:{
    registrations:"public/registrations",
    sessions:"public/sessions"
  }
  
  namespace:admin do
    resources:courts,except:[:new,:create]
  end
  scope module: :public do
    resources:courts,except:[:update,:edit,:destroy]
    resources:customers,only:[:index,:show,:new]
    get "/customers/favoritecourts"=>"customers#favorite_courts",as:"favorite_courts"
    resources:comments,only:[:create,:destroy]
    resources:favorites,only:[:create,:destroy]
    resources:circles
    resources:events,except:[:index,:edit,:update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
