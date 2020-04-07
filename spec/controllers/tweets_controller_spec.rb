require 'rails_helper'

describe TweetsController do
  describe 'GET #new'
  it "renders the :new template" do
    get :new
    expect(response).to render_template :new
  end

  describe 'GET #edit' do
    it "render the :edit template" do
      tweet = create(:tweet)
      get :edit, params: {id: tweet}
      expect(assigns(:tweet)).to eq tweet
    end

    it "render the :edit template" do
      tweet = create(:tweet)
      get :edit, params: {id: tweet}
      expect(response).to render_template :edit
    end
  end
  
end

