class MainController < ApplicationController
  def index
    @list = Demo.all
  end
end
