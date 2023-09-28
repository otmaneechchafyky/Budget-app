# app/controllers/transactions_controller.rb

class TransactionsController < ApplicationController
    before_action :authenticate_user!  # Ensure user is authenticated
    before_action :set_category, only: [:index]
  
    def index
      @transactions = @category.category_transactions.order(created_at: :desc)
      @total_amount = @transactions.sum(:amount)  # Calculate the total amount
    end

    def new
      @category = current_user.categories.find(params[:category_id])
      @transaction = @category.category_transactions.new
    end

    def create
      @category = current_user.categories.find(params[:category_id])
      @transaction = @category.category_transactions.new(transaction_params)
    
      if @transaction.save
        redirect_to category_transactions_path(@category), notice: "Transaction created successfully."
      else
        render :new
      end
    end
    
    private
  
    def set_category
      @category = current_user.categories.find(params[:category_id])
    end

    def transaction_params
      params.require(:transaction).permit(:name, :amount)
    end
  end
  