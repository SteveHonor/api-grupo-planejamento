class Mail::ContactsController < ApplicationController
  before_action :set_mail_contact, only: [:show, :update, :destroy]

  # GET /mail/contacts
  def index
    @mail_contacts = Mail::Contact.all

    render json: @mail_contacts
  end

  # GET /mail/contacts/1
  def show
    render json: @mail_contact
  end

  # POST /mail/contacts
  def create
    @mail_contact = Mail::Contact.new(mail_contact_params)

    if @mail_contact.save
      render json: @mail_contact, status: :created, location: @mail_contact
    else
      render json: @mail_contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mail/contacts/1
  def update
    if @mail_contact.update(mail_contact_params)
      render json: @mail_contact
    else
      render json: @mail_contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mail/contacts/1
  def destroy
    @mail_contact.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail_contact
      @mail_contact = Mail::Contact.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mail_contact_params
      params.require(:mail_contact).permit(:name, :mail, :phone, :message)
    end
end
