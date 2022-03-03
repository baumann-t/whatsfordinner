class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def search
  end
end
