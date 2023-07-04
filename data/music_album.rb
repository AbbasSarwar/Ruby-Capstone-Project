require_relative "../item"

class MusicAlbum < Item
    attr_reader :on_spotify
    def initialize(on_spotify ,id ,genre ,source ,label ,publish_date)
        super(on_spotify ,id , genre ,source ,label ,publish_date )
        @on_spotify = on_spotify
    end

    def can_be_archived?
        super && @on_spotify
end