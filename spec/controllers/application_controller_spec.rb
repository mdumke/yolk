require 'spec_helper'

describe ApplicationController do
  describe 'GET #welcome' do
    context 'with signed out user' do
      let!(:farm) { create(:farm) }
      let!(:review) { create(:review) }

      before { get :welcome }

      it 'sets @farms' do
        expect(assigns(:farms)).to be_present
      end

      it 'sets @review' do
        expect(assigns(:review)).to be_present
      end
    end

    it 'redirects logged in users to the home path' do
      login
      get :welcome
      expect(response).to redirect_to home_path
    end
  end
end

