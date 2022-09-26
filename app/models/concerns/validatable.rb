module Validatable
  extend ActiveSupport::Concern

  included do
    validates :name, :document, presence: true
  end
end