class Play < ApplicationRecord
    belongs_to :user
    belongs_to :song

    def self.total_plays(song)
        all_plays = Play.where(song_id: song.id)
        # byebug
        if !all_plays.empty?
            all_plays.sum { |play| play.num_plays }
        else
            return nil
        end
    end
end
