class User < ApplicationRecord
    has_many :plays
    has_many :songs, through: :plays

    validates :age, numericality: {greater_than: 0, only_integer: true}
    validates :name, presence: true
end
