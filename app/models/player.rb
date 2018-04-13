class Player

  @@current_id = 0

  attr_reader :ip
  attr_accessor :id
  attr_accessor :goal_x
  attr_accessor :goal_y

  def initialize(ip, id)
    @ip = ip
    @id = @@current_id++
    @goal_x = 0
    @goal_y = 0
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