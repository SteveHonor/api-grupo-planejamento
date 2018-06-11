class Mail::NewslettersController < ApplicationController
  before_action :set_mail_newsletter, only: [:show, :update, :destroy]

  # GET /mail/newsletters
  def index
    @mail_newsletters = Mail::Newsletter.all

    render json: @mail_newsletters
  end

  # GET /mail/newsletters/1
  def show
    render json: @mail_newsletter
  end

  # POST /mail/newsletters
  def create
    @mail_newsletter = Mail::Newsletter.new(mail_newsletter_params)

    if @mail_newsletter.save
      render json: @mail_newsletter, status: :created, location: @mail_newsletter
    else
      render json: @mail_newsletter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mail/newsletters/1
  def update
    if @mail_newsletter.update(mail_newsletter_params)
      render json: @mail_newsletter
    else
      render json: @mail_newsletter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mail/newsletters/1
  def destroy
    @mail_newsletter.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail_newsletter
      @mail_newsletter = Mail::Newsletter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mail_newsletter_params
      params.require(:mail_newsletter).permit(:mail, :status)
    end
end
