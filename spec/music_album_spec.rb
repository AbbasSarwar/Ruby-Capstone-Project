require_relative "../music_album"
require "date"

describe MusicAlbum do
    it "create Music album" do
        create_music = MusicAlbum.new(nil, Date.parse("2021-03-22"), true)
        expect(create_music.publish_date).to eq(Date.parse("2021-03-22"))
    end

    it "On spotify? checking" do
        create_music = MusicAlbum.new(nil, Date.parse("2001-01-12"), false)
        expect(create_music.on_spotify).to eq(false)
    end
end
