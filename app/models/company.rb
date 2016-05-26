class Company < ActiveRecord::Base
  attr_accessible :user, :adress, :name, :description, :latitude, :longitude,
      :time_opens, :time_closes, :token, :user_id, :days

  belongs_to :user
  before_create { generate_token(:token) }

  validates   :name,
              presence: true

  validate :end_after_start_time

  validates :time_opens, :time_closes, :presence => true

  validates   :description,
              presence: true,
              :on => :create,
              length:{ maximum: 280 }

def to_param
  token
end

def generate_token(column)
    begin
        self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
end

private
  def end_after_start_time
    return if time_closes.blank? || time_opens.blank?

    if time_closes < time_opens
      errors.add(:end_at, "Horário final deve ser após data inicial")
    end
  end
end
