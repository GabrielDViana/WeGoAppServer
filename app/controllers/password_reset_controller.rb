class PasswordResetController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
  end

  def edit
    user = User.find_by_password_reset_key!(params[:key])
    render json: user
  end

# Se a chave ainda for valida ele autoriza a edição
  def update
    user = User.find_by_password_reset_key!(params[:key])
    if user.password_reset_sent_at < 3.hours.ago
      puts "Chave para redefinição de senha expirada"
    elsif user.update_attributes(params[:user])
      render json: user
      puts "Senha atualizada!"
    end
  end
end
