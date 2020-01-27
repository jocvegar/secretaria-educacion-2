class Assignment < ApplicationRecord
	belongs_to :team
	belongs_to :package, inverse_of: :assignments

	validates :time_type, inclusion: { in: %w(day week year),
		message: "%{value} no es una opción valida" }, allow_nil: true

	validates :time_unit, numericality: { greater_than: 0,
		message: "%{value} no es una opción valida" }, allow_nil: true
end
