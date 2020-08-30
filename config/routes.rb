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
          patch 'create_use_check'
        
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
            get 'asesment_affter'
            patch 'asesment_update'
          end
          collection do
            get 'asesment_new'
            post 'create_asesment_basic_info'
          end  
        end
        resources :businesslogs,only: :update do #業務日誌
          collection do
            get 'new_businesslog' #業務日誌新規作成
            post 'create_businesslog'
            get 'businesslog_clients' #本日の業務日誌
            post 'businesslog_clients_create' #業務日誌完成
            patch 'update_businesslog_client_now' #利用者の追加
          end
          member do
            get 'affter_businesslog' #業務日誌作成後
            patch 'update_businesslog'
          end  
        end
        resources :nurselogs, only: :update do #看護日誌
          collection do
            get 'new_nurse_log' #昼休みやること、indexにしてeachしてその日のデータをとってくる！
            post 'create_nurse_log'
          end
          member do
          end
        end  
          resources :foodcooks, only: :update do #厨房提出食事確認欄
            collection do
              get 'food_check' #8/28昼休みやること、indexにしてeachしてその日のデータをとってくる！まずはeach!!
              post 'creat_food_check'
            end
            member do
            end  
          end

    end
    
  end
    
    
        
      
                   
    
    
      
      
    