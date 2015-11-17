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

  describe 'GET new' do
    before { login }

    it 'sets a new @farm variable' do
      get :new
      expect(assigns(:farm)).to be_a_new_record
    end

    it_behaves_like 'requires authenticated user' do
      let(:action) { get :new }
    end
  end

  describe 'Post create' do
    before { login }

    context 'with valid data' do
      it 'redirects to the new farms show-page' do
        post :create, farm: attributes_for(:farm)
        expect(response).to redirect_to farm_path(Farm.last)
      end

      it 'creates a new farm' do
        post :create, farm: attributes_for(:farm)
        expect(Farm.count).to eq 1
      end

      it 'sets the flash-notice' do
        post :create, farm: attributes_for(:farm)
        expect(flash[:notice]).to be_present
      end
    end

    context 'with invalid data' do
      before { post :create, farm: {invalid: 'data'} }

      it 'does not create a new farm' do
        expect(Farm.count).to eq 0
      end

      it 'renders the new-form again' do
        expect(response).to render_template 'new'
      end

      it 'sets the @farm variable' do
        expect(assigns(:farm)).to be_present
      end

      it 'sets the error-flash' do
        expect(flash[:error]).to be_present
      end
    end

    it_behaves_like 'requires authenticated user' do
      let(:action) { get :new }
    end
  end
end

