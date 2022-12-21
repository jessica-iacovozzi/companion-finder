class Dog < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_address,
                  against: %i[address],
                  using: {
                    tsearch: { prefix: true }
                  }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
