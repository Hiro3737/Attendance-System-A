Rails.application.routes.draw do
  root 'static_pages#top'
  get '/signup', to: 'users#new'
  
  # ログイン機能
  get '/login', to: 'sessions#new' # ログインページ
  post   '/login', to: 'sessions#create' # セッション作成（ログイン）
  delete '/logout', to: 'sessions#destroy' # セッション削除（ログアウト）
  # createやdestroyには対応するビューが必要ないため、
  # ここでは指定せずにSessionsコントローラに直接追加
  
  resources :users do
    collection { post :import}
    # memberブロックをリソースブロックに追加する
    member do
      get 'edit_basic_info'
      patch 'update_basic_info'
      get 'attendances/edit_one_month' # 勤怠編集ページのルーティング
      patch 'attendances/update_one_month' # 勤怠編集ページをまとめて更新する為のルーティング。
    end
    # 勤怠データは、アップデートのみ。
    resources :attendances do
      patch 'update'
      get 'overtime'
    end
  end
end