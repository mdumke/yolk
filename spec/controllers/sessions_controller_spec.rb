require 'spec_helper'

describe SessionsController do
  describe 'GET new' do
    it 'redirects logged in users to the home path' do
      login
      get :new
      expect(response).to redirect_to home_path
    end
  end

  describe 'POST create' do
    let!(:user) { create(:user) }

    context 'with valid data' do
      before do
        post :create, email: user.email, password: user.password
      end

      it 'logs the user in' do
        expect(session[:user_id]).to eq user.id
      end

      it 'redirects to the home path' do
        expect(response).to redirect_to home_path
      end

      it 'sets the flash-notice' do
        expect(flash[:notice]).to be_present
      end
    end

    context 'with invalid data' do
      before { post :create, email: user.email, password: '123_false' }

      it 'does not log the user in' do
        expect(session[:user_id]).to be_nil
      end

      it 'render the new template again' do
        expect(response).to render_template 'new'
      end

      it 'sets the error-flash' do
        expect(flash[:error]).to be_present
      end
    end
  end

  describe 'GET destroy' do
    before do
      login
      get :destroy
    end

    it 'logs the user out' do
      expect(session[:user_id]).to be_nil
    end

    it 'redirects to root-path after logout' do
      expect(response).to redirect_to root_path
    end
  end
end

