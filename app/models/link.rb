class Link < ActiveRecord::Base

  belongs_to :submission

  validates :path, url: true

end
