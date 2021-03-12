class OrganisationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_organisation, only: [:show, :edit, :update, :destroy]
  before_action :check_admin

  def new; end
  def show; end
  def edit; end

  def create
    @organisation = Organisation.new(organisation_params)

    if @organisation.save
      redirect_to @organisation
    else
      render action: 'new'
    end
  end

  def index
    @organisations = Organisation.all
  end

  def update
    if @organisation.update(organisation_params)
      redirect_to @organisation
    else
      render action: 'edit'
    end
  end

  def destroy
    @organisation.destroy
    redirect_to organisations_path
  end

  private

  def organisation_params
    params.require(:organisation).permit(:name, :email, :description, :path_to_image)
  end

  def set_organisation
    @organisation = Organisation.find(params[:id])
  end
end
