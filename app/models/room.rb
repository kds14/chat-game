class Room
    @@rooms = []
    @@next_room_id = 0
    max_players = 10

    attr_accessor :players
    attr_accessor :room_id

    def initialize()
        @@rooms << self
        @room_id = @@next_room_id
        @@next_room_id += @@next_room_id
        @players = []
    end

    def add_player(ip)
        p = Player.new(ip)
        @players << p
        p
    end

    def to_json
        r = self.as_json
        r["players"].each do |item|
            item.delete_if {|key, value| key == "ip"}
        end
        r.to_json
    end
end