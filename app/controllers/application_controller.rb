class ApplicationController < ActionController::Base
  before_action :autheticate_user!
end
