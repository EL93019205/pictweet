require 'rails_helper'

describe TweetsController do
  describe 'GET #new'
  it "renders the :new template" do
    get :new
    expect(response).to render_template :new
  end
  
end

