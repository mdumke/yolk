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

  describe 'POST create' do
    before { login }

    context 'with valid data' do
      let(:farm1) { create(:farm) }

      before do
        post :create, farm_id: farm1.id, review: {rating: 4, body: 'good'}
      end

      it 'redirects to the farm view after creation' do
        expect(response).to redirect_to farm1
      end

      it 'creates a new review for the given farm' do
        expect(farm1.reviews.count).to eq(1)
      end

      it 'sets the current user as reviewer' do
        expect(farm1.reviews.first.reviewer).to eq(current_user)
      end

      it 'sets the flash notice' do
        expect(flash[:notice]).to be_present
      end
    end

    context 'with invalid data' do
      let(:farm1) { create(:farm) }

      before do
        post :create, farm_id: farm1.id, review: {this: 'fails'}
      end

      it 'does not create a new review' do
        expect(farm1.reviews.count).to eq(0)
      end

      it 'sets the error-flash' do
        expect(flash[:error]).to be_present
      end

      it 'sets @review' do
        expect(assigns(:review)).to be_present
      end

      it 'renders the farm-view template' do
        expect(response).to render_template 'show'
      end
    end

    it_behaves_like 'requires authenticated user' do
      let(:action) { post :create }
    end
  end
end

