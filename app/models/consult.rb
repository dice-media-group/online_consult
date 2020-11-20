class Consult < ApplicationRecord
    has_many_attached   :images
    has_many            :orders
    has_rich_text       :description

    validates   :sku, uniqueness: true
    validates   :title, uniqueness: true
    validates   :title, :sku, :meeting_limit, :minutes_per_meeting, presence: true

end
