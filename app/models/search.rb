class Search < ActiveRecord::Base
  def search_company
    companies = Company.all
    companies = companies.where(["name LIKE ?","%#{keywords}%"]) if keywords.present?
    companies = companies.where(["description LIKE ?","%#{keywords}%"]) if keywords.present?
    companies = companies.where(["average_rating LIKE ?", average_rating]) if average_rating.present?
    place = Geokit::LatLng.new(latitude,longitude)
    companies = companies..within(distance, :origin => place).all if distance.present?

    return companies
  end
end
