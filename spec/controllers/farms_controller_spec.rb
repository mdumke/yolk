require 'spec_helper'

describe FarmsController do
  describe 'GET index' do
    before do
      login
      create(:farm)
      create(:review)
    end

    it 'sets the @farms variable to list all farms' do
      get :index
      expect(assigns(:farms).count).to be_present
    end

    it 'sets the @review variable' do
      get :index
      expect(assigns(:review)).to be_present
    end

    it_behaves_like 'requires authenticated user' do
      let(:action) { get :index }
    end
  end
end

