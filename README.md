# アプリケーション名
FTR-Tasks

# アプリケーション概要
- グループ毎のプロジェクト管理機能
- プロジェクト毎のタスク管理機能

# URL
https://ftr-tasks.herokuapp.com/

# テスト用アカウント
- メールアドレス
hiro_miyagi@test.co.jp
- パスワード
4894Hiro


# 利用方法
1. ユーザー登録をする
1. グループボードからグループを作成
1. 作成したグループ内でプロジェクトを作成
1. プロジェクトごとにタスクを作成

# 目指した課題解決
- プロジェクトが複数あり、プロジェクトごとの優先順位に悩む
→グループ内で抱えているプロジェクトを一覧表示し、スケジュール管理をする機能

- グループ内のメンバーがどの程度タスクを抱えているのか見えない
→メンバーが抱えているタスクを一覧表示する機能
　
- 現状のシステムはエクセル・VBAで管理しているため、タスクが増えたとき（修正等が発生したとき）の管理が煩雑
→ユーザーが誰でもタスク登録できるような機能

- 毎回「次は何をしたらいいですか」に答えを考えるのが大変
→プロジェクト毎のスケジュールがグループ内の誰でも確認できる機能

# 洗い出した要件
- ユーザーのサインアップ、サインイン機能
- グループ管理機能
- プロジェクト管理機能
- タスク管理機能
- スケジュール機能
- 工数（見積、実績）管理機能

# 現在実装した機能
現在実装した機能は以下の通り。
- ユーザーのサインアップ、サインイン機能
[![Image from Gyazo](https://i.gyazo.com/a25ed8b8563716ab9baa09c02c44e331.gif)](https://gyazo.com/a25ed8b8563716ab9baa09c02c44e331)

- グループ管理機能
[![Image from Gyazo](https://i.gyazo.com/c24c897215c92d658db892d3396e9334.gif)](https://gyazo.com/c24c897215c92d658db892d3396e9334)

- プロジェクト管理機能
[![Image from Gyazo](https://i.gyazo.com/4f527171a0668f36feaa401dc07bebce.gif)](https://gyazo.com/4f527171a0668f36feaa401dc07bebce)

- タスク管理機能（プロジェクトにタスクを追加）
[![Image from Gyazo](https://i.gyazo.com/e7b6fe49222d757c77fef2a7f243989d.gif)](https://gyazo.com/e7b6fe49222d757c77fef2a7f243989d)


# 実装予定の機能
- グループ毎のメンバー追加機能
<br>
グループボードにメンバーのToDOリストを表示する機能を追加予定

- タスク管理機能（メンバー毎にタスクを振り分け）
<br>
メンバーのToDOリストにプロジェクト毎のタスクを振り分ける機能を追加予定

- スケジュール機能
<br>
プロジェクトのスケジュールを表示する機能を追加予定

- 工数（見積、実績）管理機能
<br>
タスクの工数を管理する機能を追加予定


# データベース設計

## users テーブル

| Column             | Type    | Options                |
| ------------------ | ------- | ---------------------- |
| email              | string  | null:false,unique:true |
| encrypted_password | string  | null:false             |
| last_name          | string  | null:false             |
| first_name         | string  | null:false             |
| last_name_kana     | string  | null:false             |
| first_name_kana    | string  | null:false             |
| employee_num       | string  | null:false             |

### Association


## projects テーブル(案件情報)

| Column                 | Type                 | Options          |
| ---------------------- | -------------------- | ---------------- |
| name                   | string               | null: false      |
| job_num                | string               | null: false      |
| order_amount           | integer              | null: false      |
| delivery_date          | date                 | null: false      |
| create_user_id         | references           | foreign_key:true |

### Association


## groups テーブル(グループ情報)

| Column                 | Type                 | Options          |
| ---------------------- | -------------------- | ---------------- |
| name                   | string               | null: false      |
| create_user_id         | references           | foreign_key:true |


### Association

## group_members テーブル(グループに所属するメンバーの情報)

| Column                 | Type                 | Options          |
| ---------------------- | -------------------- | ---------------- |
| group_id               | references           | foreign_key:true |
| user_id                | references           | foreign_key:true |

### Association


## tasks テーブル(タスク情報)

| Column                 | Type                 | Options          |
| ---------------------- | -------------------- | ---------------- |
| name                   | string               | null: false      |
| content                | text                 |                  |
| time_limit             | date                 |                  |
| priority_id            | integer              |                  |
| project_id             | references           | foreign_key:true |
| create_user_id         | references           | foreign_key:true |
| row_order              | integer              | null: false |


### Association

