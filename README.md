# Mojist

## 概要
- アルバイトでは正確な時給を把握できるが、webライターはその日のタスクの内容やモチベーションによって完了する時間が変わり時給を把握できないので、時給がどのくらいなのか知りたい。→時給を管理
- タスクのスピードを管理して平均でどれくらいできそうなのかわかる
- タスク量が多く、管理できずに期限漏れが発生しているのでタスク管理をしたい
- タスクをいつやるかを決められる

## 要件
- ユーザー登録画面(sign up)で、名前・メールアドレス・パスワードを設定できる
- ユーザーはログインログアウトできる
- ログインしているユーザーの名前と現在の平均的な時給が表示される
- ログインしていれば、自分のユーザー情報のみ編集できる
- 管理者はログインできる
- 管理者は全てのユーザーを編集と削除ができる
- プロジェクト登録画面で、プロジェクト名・記事単価・文字数を登録できる
- プロジェクト一覧画面で、プロジェクトを全て見ることができ、キーワード検索と月ごとの絞り込みができる
- プロジェクト一覧画面で、それぞれ5つごとにページネーションできる
- プロジェクトが未着手・進行中・完了のどれかみられる
- プロジェクト詳細画面で、従属するタスクを見ることができる
- プロジェクト詳細画面で、プロジェクトに従属するタスクを追加できる
- プロジェクト詳細画面で、タスクの▶️を押すと、記事入力画面に遷移する
- ログインしているユーザーは、タスクを編集できる
- ログインしているユーザーは、タスクを削除ができる
- タスク登録画面で、タスク名・締切日を入力できる
- タスクは、 従属しているプロジェクトの単価と文字数が引き継がれる
- 完了日は、タイマーのfinishを押すと自動的に入力される
- 完了日が入力された場合に、タスクが完了しているかどうか判別する
- ログインしているユーザーは、プロジェクトを編集できる
- ログインしているユーザーは、プロジェクトを削除できる
- 記事入力画面では、プロジェクト名・タスク名・時間・現在の文字数・時給が表示される
- 記事入力画面では時間を測れる
- タイマーのfinishを押すと、時給がflashで表示され、従属しているプロジェクト詳細ページに遷移する
- ユーザーは、いままでの平均的な時給と、いままでの時給の履歴を見られる
- ユーザーは、自分のいままでの平均的な1000文字あたりの速度と、いままでの1000文字あたりの速度の履歴が見られる
- 時給と速度の履歴は、それぞれ月・週・日ごとに見られる

## テーブル設計
- users
    - id
    - name(名前)
    - email(メールアドレス)
    - password(パスワード)
    - admin(管理者)

- projects
    - id
    - user_id(FK)
    - name(プロジェクト名)
    - price(従属するタスクの単価に引き継がれるプロジェクトの単価)
    - number_of_word(従属するタスクの文字数に引き継がれるプロジェクトの文字数)
    - status(未着手、進行中、完了)
    - created_at(作成日)

- tasks
    - id
    - user_id(FK)
    - project_id(FK)
    - name(タスク名)
    - price(タスクの単価)
    - number_of_word(タスクの文字数)
    - due_date(締切日)
    - finished_on(完了日)

- articles(taskの記事のテーブル, has_one)
    - id
    - task_id(FK)
    - content(ライティングで入力される内容)
    - writing_speed(記事を書いた速度)
    - created_at(作成日, 作成した日付から履歴を絞って検索する)

[![Image from Gyazo](https://i.gyazo.com/aa5c5c2521a6d066a086781c024c8ac7.png)](https://gyazo.com/aa5c5c2521a6d066a086781c024c8ac7)


https://www.figma.com/file/NSrQiw5Yugr3qCk8Bj5UkX/PF?node-id=0%3A1
