require 'rails_helper'

  describe SearchesController, type: :controller do
   describe 'GET #index' do
    it "検索ページに遷移するか" do
      get :index
      expect(response).to render_template :index
    end
    it "インスタンス変数が期待したものになるか" do
      category = create(:category)
      user = create(:user)
      brand = create(:brand)
      items = create_list(:item, 1, category_id: category.id, user_id: user.id, brand_id: brand.id)
      get :index
      expect(assigns(:items)).to eq items
    end
  end

end