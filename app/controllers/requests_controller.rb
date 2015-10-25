class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /requestys
  # GET /requests.json
  def index
    own_id = current_user.id
    @all_requests = Request.all
    @requests_to_me = Request.where(:requested => own_id).where.not(:accepted => "deleted")
    @my_requests = Request.where(:requester => own_id)
  end

  # GET /requests/new
  def new
    requester = params['requester'].to_i
    requested_book = params['requested_book'].to_i
    requested = params['requested'].to_i
    accepted = "waiting"

    @request = Request.new(:requester => requester, :requested_book => requested_book,
                           :requested => requested, :accepted => accepted)
    @request.save

    redirect_to requests_path
  end

  # since we're in hurry(and we won't need these methods later) let's assume that 
  # show - will mean accepting request by user and edit - rejecting
  # GET /requests/1/edit
  def edit
    # @request = Request.find_by(params[:id])
    # determine other book in return
    @request.accepted = "rejected"
    @request.save

    redirect_to requests_path
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    # @request = Request.find_by(params[:id])
    @request.accepted = "accepted"
    @request.requester_book = Book.where(title: params[:requester_book_name])[0].id

    @request.save

    redirect_to requests_path
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    # @request = Request.find_by(params[:id])
    @request.accepted = "deleted"
    @request.save

    redirect_to requests_path

    # @request.destroy
    # respond_to do |format|
    #   format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:requester, :requested_book, :requested, :requester_book, :accepted, :requester_book_name, :test)
    end
end
