  Rails.application.routes.draw do
  

  get 'record_pdfs/index'

    root 'static_pages#top'
    get '/signup', to: 'staffs#new'
  
    # ログイン機能
    get    '/login', to: 'sessions#new'
    post   '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    
  
    resources :staffs do
      member do
        get 'shifts_edit' #今月ののシフトメンバー
        patch 'check_shifts_update'
      end

      resources :shifts, only: :update do #シフト
        collection do
          #get 'shifts_edit'
          patch 'shifts_update'
        end
      end   
    end

    post '/import', to: 'users#import', as: 'import'
    
    resources :clients do#利用者
      member do
        get 'edit_basic_info'
        patch 'update_basic_info'
        patch 'create_use_check'
        get 'businesslog_clients' #本日の業務日誌
        patch 'update_businesslog_client_now' #利用者の追加
      end
      
      resources :monitorings, only: :update do #モニタリング
        member do #idが付く！memberは特定のデータにアクションを利用する
          get 'monitoring_basic_info_affter' #過去のモニタリング
          patch 'update_monitoring_basic' #編集
          get 'monitoring_completion' #モニタリング完成
          delete 'monitoring_delete' #モニタリング削除 
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
          delete 'asesment_delete' #アセスメント削除 
          get 'asesment_completion'
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
        end
        member do
          get 'affter_businesslog' #業務日誌作成後
          delete 'businesslog_delete' #業務日誌削除 
          patch 'update_businesslog'
          get 'businesslog_completion' #業務日誌完成盤 
          get 'businesslog_completion_copy' #業務日誌コピー専用page
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

    #get 'shifts/shifts_edit' #スタッフシフトチェック
    get 'shifts/staff_sfift' #スタッフシフト
    get 'businesslogs/clients_index' #業務日誌ユーザー一覧
    patch 'businesslogs/clients_create' #業務日誌一覧完成
    get 'things/show', to: 'things#show' #pdf

    
    
    namespace :api, {format: 'json'} do
      namespace :v1 do
        resources :hoge_persons, only: [] do
          collection do
            get :profile
          end
        end
      end
    end
  end
    
    
        
      
                   
    
    
      
      
    