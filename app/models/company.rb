class Company < ActiveRecord::Base
  attr_accessible :user, :adress, :name, :description, :latitude, :longitude,
      :time_opens, :time_closes, :token, :user_id, :days

  belongs_to :user
  has_many :ratings
  has_many :favorites
  has_many :users, through: :favorites
  belongs_to :subcategory
  belongs_to :category

  before_create { generate_token(:token) }

  acts_as_mappable :default_units => :kilometers,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  serialize :days, Array
  serialize :company_images, Array
  # validates :company_images,
  #           presence: true
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

def average_rating
  if self.ratings.size > 0
    self.ratings.sum(:rate) / self.ratings.size
  end
end

def people_rated
  self.ratings.size
end

def operating
  weekday = Time.now.strftime("%A")
  time_now = Time.now.strftime("%H:%M")

  operating_days = self.days

  operating_days.each { |day|
    if weekday == day && time_now >= self.time_opens.strftime("%H:%M") &&
      time_now <= self.time_closes.strftime("%H:%M")
        return true
    end
  }
  return false
end

private
  def end_after_start_time
    return if time_closes.blank? || time_opens.blank?

    if time_closes < time_opens
      errors.add(:end_at, "Horário final deve ser após data inicial")
    end
  end
end
