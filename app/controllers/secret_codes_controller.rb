class SecretCodesController < ApplicationController
  load_and_authorize_resource

  def index
    @secret_codes = SecretCode.all
  end

  def create
    count = Integer(params[:count]) rescue 1
    @secret_codes = SecretCode.generate(count)
  end

end
