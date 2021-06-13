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

### Association

