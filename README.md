# Bookers応用課題の機能実装済み

## 機能一覧

- ユーザーによる本のタイトルと感想の投稿
- ユーザー名、プロフィール画像、自己紹介の登録と編集
- 本の投稿へのいいね機能
- 本の投稿へのコメント機能
- ユーザー同士のフォロー、フォロワー機能
- ユーザー名、本のタイトルでの検索機能と検索結果表示
- ユーザー情報に住所情報の登録
- 郵便番号から県名、市区町村を自動入力
- マイページで登録住所の地図を表示
- 会員登録完了時に登録メールアドレスに完了メールを送信
- 1:1でのチャット機能
- 1日一回全登録ユーザーに自動でメールを送信

## ページ一覧

- topページ
- aboutページ
- 新規登録ページ
- ログインページ
- ユーザー詳細ページ(ユーザー情報、新規投稿フォーム、ユーザーの投稿一覧)
- ユーザー一覧ページ(ユーザー情報、新規投稿フォーム、ユーザー一覧)
- 投稿一覧(ユーザー情報、新規投稿フォーム、投稿一覧)
- 投稿編集ページ
- ユーザー情報編集画面
- 投稿詳細ページ(ユーザー情報、新規投稿フォーム、新規コメント投稿フォーム、コメント表示)
- 検索結果表示ページ
- フォローしている人一覧ページ
- フォローされている人の一覧ページ
- 1:1のユーザー同士でのチャットページ

-------
ここから公式が書いていたREADME

### テスト手順の自動化
gemを入れて、specファイルを移動して、テストを実行するコマンドを打つという手順をまとめたcheck.shというファイルを作成した
アプリケーションのルートディレクトリにおいて
bash check.sh
というコマンドを打つと最後まで自動で終了する
ディレクトリが野原のディレクトリにあっているため、自分で修正が必要

### 実行コマンド
bundle exec rspec spec/ --format documentation

### 注意
カラム名が違うとほとんどのテストに失敗してしまうが、このコマンドですべてのファイルの文字列を変更することができる
例はopinionというカラム名で作られていたため、それをすべてbodyというカラム名に変更した
find . -type f | xargs sed -i 's/opinion/body/g'

一回テストを試していると、テスト用のデータベースtest.sqlite3ができているため、カラム名を変更したのちに再びやる時は
rm db/test.sqlite3によって、ファイルを削除してから実行する
