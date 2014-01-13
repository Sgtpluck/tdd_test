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
      tweet = create(:tweet)
      tweet2 = create(:tweet2)
      get :index
      expect(assigns(:tweets)).to match_array([tweet, tweet2])
    end

    pending it 'loads all the tweets in the view' do
      # should this go here? should we even be testing this?
      tweet = create(:tweet)
      tweet2 = create(:tweet2)
      get :index
      expect(response.body).to include(tweet.body)
      expect(response.body).to include(tweet2.body)
    end
  end

  describe 'GET#show' do

    it 'is successful' do
      tweet = create(:tweet)
      get :show, id: tweet.id
      expect(response).to be_successful
    end
  end

  describe 'GET#new' do
    it 'is successful' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST#create' do 
    # figure out how to do these two with FactoryGirl
    it 'should create a new tweet' do
      # tweet = build(:tweet)
      post :create, tweet: { body: 'whatever', author: 'you' }
      expect(response).to be_redirect
    end

    it 'should render the new template if not saved' do
      post :create, tweet: { body: 'your mom' } 
      expect(response).to render_template(:new)
    end
  end
end
