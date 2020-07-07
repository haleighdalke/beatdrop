class User < ApplicationRecord
    has_many :plays
    has_many :songs, through: :plays
end
