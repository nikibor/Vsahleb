class BackupController < ApplicationController
  def index
    @products = Story.order(:created_at)
    respond_to do |format|
      format.html
      format.csv { send_data @products.to_csv }
    end
  end
end
