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
    company = Company.new (company_params);
    @unreadFile = Array.new
    @unreadFile = company_params[:company_images];
    @file = Array.new
    @file.each do |f|
      @unreadFile.each do |u|
        f.file = u.unreadFile.tempfile.read
      end
    end

    @pics = Array.new
    @pics.each do |c|
      @file.each do |f|
        c.company_images = Base64.encode64(f.file)
      end
    end

    @company = current_user.companys.build(name: company.name,
    description: company.description, time_opens: company.time_opens,
    time_closes: company.time_closes, adress: company.adress,
    latitude: company.latitude, longitude: company.longitude,
    token: company.token, company_images:@pics.company_images)
    @company.user_id = current_user.id
    if @company.save
      puts 'success'
    else
      puts 'fail'
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
        :latitude, :longitude, :token, :company_images)
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
