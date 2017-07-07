# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration


* Database creation
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|name|string|null: false, add_index|
|email|text|null: false, unique: true|
|encrypted_password|
|reset_password_tpken|
|reset_password_sent_at|
|remenber_created_at|
|sign_in_count|integer|null: false|
|current_sign_in_at|integer|null: false|
|last_sign_in_at|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :member


## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|name|string|null:false|


## Association
-belongs_to :menbers
-has_many :messages

## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user
-membersテーブルは中間テーブル

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|body|text||

## Association
-belongs_to :user
-belongs_to :group
-has_many :image

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, unique: true|
|image_url|text||

## Association
-belongs_to :message
-belongs_to :group
-belongs_to :user



* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
