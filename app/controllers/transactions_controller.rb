class TransactionsController < ApplicationController
	def index
		"user's transactions"
	end

	def show
    end

	def create 
		puts params
	end

	def new
    	@transaction = Transaction.new
    end

    def edit
  	end

    def create
      @book = Book.new(book_params)

      respond_to do |format|
        if @transaction.save
          format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
          format.json { render :show, status: :created, location: @transaction }
        else
          format.html { render :new }
          format.json { render json: @transaction.errors, status: :unprocessable_entity }
        end
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Transaction.find(params[:id])
    end


	def tr_params
      params.require(:transactions).permit(:requester, :requested_book, :requested,
      									   :requester_book, :accepted )
    end
end
