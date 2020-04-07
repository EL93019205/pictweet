require 'rails_helper'

describe TweetsController do
  describe 'GET #new'
  it "renders the :new template" do
    get :new
    expect(response).to render_template :new
  end

  describe 'GET #edit' do
    it "assigns the requested tweet to @tweet" do
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

  describe 'GET #index' do
    it "populates an array of tweets ordered by created_at DESC" do
      tweets = create_list(:tweet, 3)
      get :index
      expect(assigns(:tweets)).to match(tweets.sort{ |a,b| b.created_at <=> a.created_at } )
    end

    it "renders the :index template" do
    end
  end

end

