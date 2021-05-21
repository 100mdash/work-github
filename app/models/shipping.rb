class Shipping < ApplicationRecord
  
  belongs_to :customer
  
  def address_info
    self.zip_code+self.address+self.name
  end
  
end
