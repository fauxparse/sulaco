class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :not, -> (*records) { where.not(id: records.flatten.map(&:id)) }
end
