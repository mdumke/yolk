require 'spec_helper'

describe ApplicationController do
  describe 'GET #welcome' do
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
end

