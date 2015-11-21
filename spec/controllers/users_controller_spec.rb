require 'spec_helper'

describe UsersController do
  describe 'GET show' do
    it 'sets @user' do
      login
      alice = create(:user)
      review = create(:review, reviewer: alice)
      get :show, id: alice.id
      expect(assigns(:user)).to eq(alice)
    end

    it 'redirects when the user is not found' do
      login
      get :show, id: current_user.id + 10
      expect(response).to redirect_to home_path
    end

    it 'sets the error flash when the user is not found' do
      login
      get :show, id: current_user.id + 10
      expect(flash[:error]).to be_present
    end

    it_behaves_like 'requires authenticated user' do
      let(:action) { get :show, id: 1 }
    end
  end

  describe 'GET new' do
    it 'sets a new user variable' do
      get :new
      expect(assigns(:user)).to be_a_new_record
    end

    it 'redirects logged in users to the home path' do
      login
      get :new
      expect(response).to redirect_to home_path
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

