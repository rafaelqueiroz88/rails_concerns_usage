module Filterable
  extend ActiveSupport::Concern

  def filter_by_color
    Car.where.not(color: 'White')
  end
end
