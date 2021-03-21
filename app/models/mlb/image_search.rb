class Mlb::ImageSearch
    attr_reader :headshot, :image
    def initialize(id)
        player = Mlb::MlbPlayer.find_by(id: id)
        player_name = player.name_display_first_last.gsub(".","").gsub(" ","-").downcase()
        search = "#{player_name}-#{id.to_s}"
        doc = Nokogiri::HTML(URI.open("https://www.mlb.com/player/#{search}"))
        @headshot = doc.at_css('.player-headshot')["src"]
        @image = doc.at_css('.player-header')["style"].gsub("background-image: url('","").delete_suffix("')")
    end
end