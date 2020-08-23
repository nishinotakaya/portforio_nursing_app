  Rails.application.routes.draw do
  

    root 'static_pages#top'
    get '/signup', to: 'staffrs#new'
  
    # ログイン機能
    get    '/login', to: 'sessions#new'
    post   '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    
  
    resources :staffs do
      member do
       
       
      end
    end
    post '/import', to: 'users#import', as: 'import'
    
    resources :clients do#利用者
      member do
        get 'edit_basic_info'
        patch 'update_basic_info'
       
      end
        
      
      
      resources :monitorings, only: :update do #モニタリング
        member do #idが付く！memberは特定のデータにアクションを利用する
          get 'monitoring_basic_info_affter' #過去のモニタリング
          patch 'update_monitoring_basic' #編集
        end
        collection do
          get 'monitoring_basic_info' #モニタリング新規作成
          post 'create_monitoring_new' #モニタリング新規作成ボタン
          
        end
      end
      
      resources :asesments, only: :update do
        member do
        end
        collection do
          get 'asesment_new'
          post 'create_asesment_basic_info'
        end  
      end  
    end
    
    
    
        
      
                   
    
  end
    
      
      
    