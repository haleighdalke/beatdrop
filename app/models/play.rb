gitclass Play < ApplicationRecord
    belongs_to :user
    belongs_to :song

    def self.total_plays(song)
        sum = 0
        Play.all.each do |play|
            if play.song_id == song.id
                sum += play.num_plays
            end
        end
        sum
    end
end
 #online is linking here as error message