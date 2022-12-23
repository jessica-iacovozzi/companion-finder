class Organization < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_postcode,
                  against: %i[postcode],
                  using: {
                    tsearch: { prefix: true }
                  }
  geocoded_by :postcode
  after_validation :geocode, if: :will_save_change_to_postcode?
end
