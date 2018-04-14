class Player

  @@current_id = 0

  attr_reader :ip
  attr_accessor :id
  attr_accessor :x
  attr_accessor :y

  def initialize(ip)
    @ip = ip
    @id = @@current_id
    @@current_id += 1
    random_pos
  end

  def set_pos(x, y)
    @x = x
    @y = y
  end

  def to_s
    "#{id} (#{ip}) : (#{x}, #{y})"
  end

  def to_json(options={})
    options[:except] ||= [:ip]
    super(options)
  end

  def random_pos
    t = Time.now
    rng = Random.new(t.to_i)
    @x = rng.rand(200...300).to_i
    @y = rng.rand(200...300).to_i
  end
end