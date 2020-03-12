crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", users_path
  parent :root
end

crumb :card_new do
  link "支払い情報の登録", new_card_path
  parent :mypage
end

crumb :card_show do
  link "支払い情報の確認", card_index_path
  parent :mypage
end

crumb :item_new do
  link "出品ページ", new_item_path
  parent :root
end

