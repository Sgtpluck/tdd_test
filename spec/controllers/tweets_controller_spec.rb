require 'spec_helper'

describe TweetsController do

  describe 'GET#index' do

    it 'should be successful' do
      get :index
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'loads all the tweets' do
      create(:tweet)
      create(:tweet2)
      get :index
      expect(assigns(:tweets)).to eq(Tweet.all)
    end

    it 'loads all the tweets in the view' do
      create(:tweet)
      create(:tweet2)
      get :index
      expect(response.body).to include("MyString")
      expect(response.body).to include("MyString2")
    end
  end

  describe 'GET#show' do

    pending it 'should be successful' do
      pending me learning how to write this with factory girl
    end
  end

  describe 'GET#new' do
    it 'is successful' do
      get :new
      expect(response).to be_successful
    end

    # figure out how to do these next two using FactoryGirl when off the plane

    it 'should create a new tweet' do
      get :new
      post 'create', { tweet: { body: 'a body', 
                                author: 'davida'} }
      expect(response).to redirect_to(:index)
    end

    it 'should render the new template if not saved' do
      get :new
      post 'create', { tweet: { body: 'a body', 
                                author: 'davida'} }
      expect(response).to render_template(:new)
    end
  end
end
