class Metric < ActiveRecord::Base
  has_and_belongs_to_many :championships
end
