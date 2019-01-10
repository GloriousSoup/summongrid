class Event < ApplicationRecord
    include Rails.application.routes.url_helpers

    has_many :players

    include UniqueKey
end
