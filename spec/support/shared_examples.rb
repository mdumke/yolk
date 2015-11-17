shared_examples 'requires authenticated user' do
  before do
    logout
    action
  end

  it 'sets the error-flash for unauthenticated users' do
    expect(flash[:error]).to be_present
  end

  it 'redirects unauthenticated users to the front-path' do
    expect(response).to redirect_to root_path
  end
end

