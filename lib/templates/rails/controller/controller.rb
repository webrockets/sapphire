class <%= class_name %>Controller < ApplicationController
  before_action :authenticate_user!
end