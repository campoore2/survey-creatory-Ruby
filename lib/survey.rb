class Survey < ActiveRecord::Base
  has_many(:question)
  before_save(:cap_letter)

private
  define_method(:cap_letter) do
    self.name=(name().capitalize())
  end
end
