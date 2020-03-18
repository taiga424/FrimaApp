FactoryBot.define do
  factory :image do
    content { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/ダウンロード.jpeg')) }
    item_id {"2"}
    item
  end
end