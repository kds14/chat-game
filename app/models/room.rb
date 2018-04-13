class Room

    max_players = 10
    attr_accessor :players

    def initialize()
        @players = []
    end

    def add_player(ip)
        @players << Player.new(ip)
    end

    def client_id(ip)
        "#{@players.select{ |item| item.ip == ip}[0].id}"
    end

    def to_json
        r = self.as_json
        r["players"].each do |item|
            item.delete_if {|key, value| key == "ip"}
        end
        r.to_json
    end
end