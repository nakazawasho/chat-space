# README
* Database creation

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index, unique:true|
|email|text|null: false, unique: true|


### Association
- has_many :messages
- has_many :messages, thought: :members

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null:false|

## Association
-has_many :messages
-has_many :members, thought: :members


## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user
- membersテーブルは中間テーブル

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|body|text||
|image|text||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

## Association
-belongs_to :user
-belongs_to :group
