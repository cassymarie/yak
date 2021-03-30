class LineupPlayerSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :lineup, :mlb_player, :position, :dh
    set_key_transform :camel
end
