# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|furigana_first|string|null: false|
|furigana_last|string|null: false|
|birthdate|date|null: false|
|postal_code|integer|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|number|string|null: false|
|building|string|
|tel|integer|

### Association
- has_many :items


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|description|text|null: false|
|price|integer|null: false|
|image|string|null: false|
|brand|string|
|condition|integer|
|fee|integer|null: false|
|area|integer|null: false|
|shipping_days|integer|null: false|

### Association
- belongs_to :user
- belongs_to :category


## Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|ancestry|string|null: false|

### Association
- has_many :items
