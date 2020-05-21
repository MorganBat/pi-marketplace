class Listing < ApplicationRecord
    # Set listings to belong to a user in table
    belongs_to :user
    # Allow user to upload an image to attach to the listing
    has_one_attached :image
end
