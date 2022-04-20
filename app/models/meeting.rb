class Meeting < ApplicationRecord
  belongs_to :mentor
  belongs_to :fellow
end
