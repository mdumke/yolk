require 'spec_helper'

describe UsersController do
  describe 'GET new' do
    it 'sets a new user variable' do
      get :new
      expect(assigns(:user)).to be_a_new_record
    end
  end

  describe 'POST create' do
    context 'with valid data' do
      before { post :create, user: attributes_for(:user) }

      it 'creates a new user' do
        expect(User.count).to eq 1
      end

      it 'redirects to the home_path' do
        expect(response).to redirect_to home_path
      end

      it 'sets the flash notice' do
        expect(flash[:notice]).to be_present
      end

      it 'automatically logs the user in' do
        expect(session[:user_id]).to eq User.first.id
      end
    end

    context 'with invalid data' do
      before { post :create, user: {invalid: 'data'} }

      it 'does not create a new user' do
        expect(User.count).to eq 0
      end

      it 'sets the @user variable' do
        expect(assigns(:user)).to be_present
      end

      it 'renders the new template again' do
        expect(response).to render_template 'new'
      end

      it 'sets the error-flash' do
        expect(flash[:error]).to be_present
      end
    end
  end
end

