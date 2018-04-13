class Player

  @@current_id = 0

  attr_reader :ip
  attr_accessor :id
  attr_accessor :goal_x
  attr_accessor :goal_y

  def initialize(ip)
    @ip = ip
    @id = @@current_id
    @@current_id += 1
    @goal_x = 50
    @goal_y = 50
  end

  def set_goal(x, y)
    @goal_x = x
    @goal_y = y
  end

  def to_s
    "#{id} (#{ip}) : (#{goal_x}, #{goal_y})"
  end

  def to_json(options={})
    options[:except] ||= [:ip]
    super(options)
  end
end