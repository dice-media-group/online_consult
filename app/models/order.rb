class Order < ApplicationRecord
  belongs_to :consult

private

  def generate_token
    self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end

end
