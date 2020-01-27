# 本アプリ作成の目的
- Firebaseに関する技術の習得
  - Authentication: ユーザ認証機能
  - Cloud Firestore: リアルタイムNoSQLデータベース機能
- MVVMに慣れる
  - 単方向依存を意識した設計(View -> ViewModel -> Model)
- Swift5で発表された新機能を体験
  - Combine: イベントの発行・購読ができるフレームワーク(非同期処理が容易に)
  - SwiftUI: UIを宣言的に構築できるUIフレームワーク

# 画面イメージ
## ログイン画面
![ログイン画面](/doc_img/LoginView.PNG) 
## メイン画面
![メイン画面](/doc_img/MainView.PNG) 
## プロフィール画面
![プロフィール画面](/doc_img/ProfileView.PNG) 
## ユーザ検索画面(初期)
![ユーザ検索画面(初期)](/doc_img/SearchUserView_init.PNG) 
## ユーザ検索画面(成功時)
![ユーザ検索画面(成功時)](/doc_img/SearchUserView_success.PNG) 
## ユーザ検索画面(失敗時)
![ユーザ検索画面(失敗時)](/doc_img/SearchUserView_failure.PNG) 

# 実装機能
## ログイン画面
- 入力した内容でユーザ認証
  - 認証成功時メイン画面へ遷移
  - 認証失敗時は遷移しない
## メイン画面
- ログインしたユーザに紐づいた友達リストの表示
## プロフィール画面
- ユーザ情報の表示
- サインアウト機能
## ユーザ検索画面
- ユーザ検索機能
  - 検索成功時ユーザの友達追加確認
  - 検索失敗時はエラーメッセージの表示

# 追加予定機能
- チャット機能とか

