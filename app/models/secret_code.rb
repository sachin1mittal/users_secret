class SecretCode < ActiveRecord::Base
  belongs_to :user
  validates :code, uniqueness: true, presence: true

  def self.generate(count = 1)
    return [] if count < 1
    (1..count).map do
      code = new(code: generate_unique_code)
      code.save(validate: false)
      code
    end
  end

  def self.generate_unique_code
    begin
      code = SecureRandom.hex(5)
    end while exists?(code: code)
    code
  end
end
