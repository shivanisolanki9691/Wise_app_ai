class AccountsController < ApplicationController
	skip_before_action :verify_authenticity_token
	skip_before_action :authorized, only: [:create, :login, :verify_otp]
	def create
    @account = Account.new(account_params)
    if @account.save
      token = encode_token({ account_id: @account.id })
      render json: { account: @account, token: token }, status: :created
    else
      render json: { error: 'Failed to create account' }, status: :unprocessable_entity
    end
	end

  def login
  	otp = generate_otp
    @account = Account.find_by(email: params[:email])
    # @account = @account.update(otp: otp)
    if @account.present?
      token = encode_token({ account_id: @account.id })
    	@user = @account.update(otp: otp)
      render json: { account: @account, token: token }

      SendMailer.send_email(@account.email, @account).deliver_now
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

	def verify_otp
	  # otp = params[:otp]
	  @account = Account.find_by(email: params[:email], otp: params[:otp])
	  if @account.present? && @account.otp == otp

	    render json: { message: 'OTP verified successfully' }
	  else
	    render json: { error: 'Invalid OTP' }, status: :unprocessable_entity
	  end
	end



	private

	def generate_otp
		rand(100_000..999_999).to_s
  end

	def account_params
		params.require(:account).permit(:username, :email, :password)
	end
end