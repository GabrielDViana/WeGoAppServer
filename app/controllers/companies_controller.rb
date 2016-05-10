class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize, only: [:new, :create, :update, :index]
  before_action :authorize, except: [:show, :index]

  def index
  end

  def new
    @company = Company.new
  end

  def create
    @company = current_user.companys.build(company_params)
    @company.user_id = current_user.id
    if @company.save
      #
    else
      #
    end
  end

  def update
    @company = Company.find_by_token(params[:token])
    if @company.update(company_params)
      #
    else
      #
    end
  end

  def show
    @users = @company.users
  end

  def edit
  end

  def destroy
      @company.destroy
  end

  private
    def set_company
      @company = Company.find_by_token(params[:token])
    end

    def company_params
      params.require(:company).permit(:name, :description, :time_opens, :time_closes, :adress,
        :latitude, :longitude, :token)
    end

    def authorize
      if current_user.nil?
        # redirect_to login_url
        # flash[:error] = "Não autorizado, por favor faça login"
      else
        if @company && @company.user != current_user
            # redirect_to root_path,
            # flash[:error] = "Usuário não autorizado!"
        end
      end
    end
end
