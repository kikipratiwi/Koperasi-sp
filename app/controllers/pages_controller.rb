class PagesController < ApplicationController
  before_action :authenticate_official!
  def home
  end
end
