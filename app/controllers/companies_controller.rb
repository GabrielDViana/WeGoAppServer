class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  # skip_before_action :authorize, only: [:new, :create, :update, :index]
  # before_action :authorize, except: [:show, :index]

  def index
  end

  def new
    @company = Company.new
  end

  def create
    # company = Company.new (company_params);
    # @unreadFile = Array.new
    # @unreadFile = company_params[:company_images];
    # @file = Array.new
    # @file.each do |f|
    #   @unreadFile.each do |u|
    #     f.file = u.unreadFile.tempfile.read
    #   end
    # end
    #
    # @pics = Array.new
    # @pics.each do |c|
    #   @file.each do |f|
    #     c.company_images = Base64.encode64(f.file)
    #   end
    # end
    @user = User.find_by_auth_token(params[:auth_token])
    @company = @user.companies.build(company_params)
    @company.user_id = @user.id
    @company.time_opens = params[:time_opens].to_time
    @company.time_closes = params[:time_closes].to_time
    @company.days = params[:days].split(",").join(", ")

    if @company.save
      render json: @company
    else
      puts @company.errors
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
        :latitude, :longitude, :token, :days)
    end

    # def authorize
    #   if current_user.nil?
    #     puts "Não autorizado, por favor faça login"
    #   else
    #     if @company && @company.user != current_user
    #         puts "Usuário não autorizado!"
    #     end
    #   end
    # end
end
