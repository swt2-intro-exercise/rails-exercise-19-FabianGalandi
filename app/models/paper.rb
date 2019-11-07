class Paper < ApplicationRecord
    validates :title, presence: true
    validates :venue, presence: true
    validates :year, numericality: { only_integer: true }

    has_and_belongs_to_many :authors

    # slick ruby code for filtering year
    scope :written_in_year, ->(year) { where("year = ?", year) if year.present? }
end
