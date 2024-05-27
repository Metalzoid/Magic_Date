class PagesController < ApplicationController
  def home
    Pages.all
  end
end
