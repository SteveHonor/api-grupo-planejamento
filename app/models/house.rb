class House < ApplicationRecord
  has_many :house_images

  before_create :generate_code

  def generate_code
    self.code = SecureRandom.hex(2)
  end
end
