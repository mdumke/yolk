class UiController < ApplicationController
  before_action do
    redirect_to root_path unless Rails.env.development?
  end

  def index
  end
end

