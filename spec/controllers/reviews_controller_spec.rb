require 'spec_helper'

describe ReviewsController do
  describe 'GET index' do
    let!(:review1) { create(:review, created_at: 2.days.ago) }
    let!(:review2) { create(:review) }
    let!(:farm) { create(:farm) }

    before { login }

    it 'retrieves @reviews ordered by created descending' do
      get :index
      expect(assigns(:reviews).to_a).to eq([review2, review1])
    end

    it 'sets @farms' do
      get :index
      expect(assigns(:farms)).to be_present
    end

    it_behaves_like 'requires authenticated user' do
      let(:action) { get :index }
    end
  end
end

