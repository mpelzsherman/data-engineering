require File.join(Rails.root, 'lib/tallyman', 'purchase_file_parser.rb')

class PurchaseUploadsController < ApplicationController
  before_action :set_purchase_upload, only: [:show, :edit, :update, :destroy]

  # GET /purchase_uploads
  # GET /purchase_uploads.json
  def index
    @purchase_uploads = PurchaseUpload.all
  end

  # GET /purchase_uploads/1
  # GET /purchase_uploads/1.json
  def show
  end

  # GET /purchase_uploads/new
  def new
    @purchase_upload = PurchaseUpload.new
  end

  # GET /purchase_uploads/1/edit
  def edit
  end

  # POST /purchase_uploads
  # POST /purchase_uploads.json
  def create
    @purchase_upload = PurchaseUpload.new(purchase_upload_params)
    parse_file(File.join(Rails.root, 'public', @purchase_upload.file.to_s))

    respond_to do |format|
      if @purchase_upload.save
        format.html { redirect_to @purchase_upload, notice: 'Purchase upload was successfully created.' }
        format.json { render action: 'show', status: :created, location: @purchase_upload }
      else
        format.html { render action: 'new' }
        format.json { render json: @purchase_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_uploads/1
  # PATCH/PUT /purchase_uploads/1.json
  def update
    respond_to do |format|
      if @purchase_upload.update(purchase_upload_params)
        format.html { redirect_to @purchase_upload, notice: 'Purchase upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @purchase_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_uploads/1
  # DELETE /purchase_uploads/1.json
  def destroy
    @purchase_upload.destroy
    respond_to do |format|
      format.html { redirect_to purchase_uploads_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_upload
      @purchase_upload = PurchaseUpload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_upload_params
      params.require(:purchase_upload).permit(:file)
    end

    def parse_file(f)
      pfp = PurchaseFileParser.new
      pfp.create_purchases(f)
    end
end
