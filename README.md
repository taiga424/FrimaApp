# README

## 本番環境
http://13.115.54.84:5000/

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|
|first_name|string|null: false|
|last_name|string|null: false|
|furigana_first|string|null: false|
|furigana_last|string|null: false|
|birthdate|date|null: false|
|tell|integer|

### Association
- has_many :items
- has_one :address
- has_many :sns_credentials
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :like_items, through: :likes, source: :item



## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|prefecture|integer|null: false|
|postal_code|integer|null: false|
|city|string|null: false|
|number|string|null: false|
|building|string|
|user_id|bigint|foreign_key: true|

### Association
- belongs_to :user, optional: true



## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|price|integer|null: false|
|condition|integer|null: false|
|fee|integer|null: false|
|area|string|null: false|
|shipping_days|integer|null: false|
|purchase_id|integer|foreign_key: true|
|brand_id|bigint|foreign_key: true|
|user_id|bigint|foreign_key: true|
|category_id|bigint|foreign_key: true|
|likes_count|integer||

### Association
- belongs_to :brand, optional: true
- belongs_to :user, optional: true
- has_many :comments, dependent: :destroy
- belongs_to :category, optional: true
- has_many :images, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :liking_users, through: :likes, source: :user
- accepts_nested_attributes_for :images, allow_destroy: true

### brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :items



## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|

### Association
- has_many :items
- has_ancestry



## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|content|string||
|item_id|bigint|foreign_key: true|

### Association
- belongs_to :item, optional: true



## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association

なし


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|foreign_key: true|
|item_id|bigint|foreign_key: true|
|text|text|null: false|

### Association
- belongs_to :item
- belongs_to :user, optional: true


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer||
|item_id|integer||

### Association
- belongs_to :item, counter_cache: :likes_count
- belongs_to :user, optional: true


## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string||
|uid|string||
|user_id|bigint|foreign_key: true|

### Association
- belongs_to :user, optional: true

# Usage
`git clone https://github.com/taiga424/FrimaApp.git`  
`cd FrimaApp`  
`rails db:create`  
`rails db:migrate`  
`rails db:seed`  
`rails s`