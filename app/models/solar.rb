class Solar < ApplicationRecord
  before_save do
    self.status = 'simulation'
  end
end
