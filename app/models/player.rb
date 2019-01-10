class Player < ApplicationRecord
    belongs_to :event

    include UniqueKey
end
