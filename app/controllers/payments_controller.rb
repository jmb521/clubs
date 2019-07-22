class PaymentsController < ApplicationController
    
    def index
        @payments = Payment.all
    end

    def new
        @payment = Payment.new
    end
    
    def create
        @payment = Payment.create(payment_params)
    end

    def edit
        @payment = Payment.find(params[:id])
    end

    def update
        @payment = Payment.find(params[:id])
    end

    def destroy
        @payment = Payment.find(params[:id])
    end


    protected
    def payment_params
        params.require(:payment).permit(:amount, :membership_id)
    end
end
