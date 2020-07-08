class Play < ApplicationRecord
    belongs_to :user
    belongs_to :song

    def self.total_plays(song, user_id)
        all_plays = Play.where(song_id: song.id, user_id: user_id)
        # byebug
        if !all_plays.empty?
            all_plays.sum { |play| play.num_plays }
        else
            return nil
        end
    end
end
