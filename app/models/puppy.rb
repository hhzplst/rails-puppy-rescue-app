class Puppy < ActiveRecord::Base
  validates :name, uniqueness: true
  validates :name, :age, :breed, :bio, :img, presence: true
end
