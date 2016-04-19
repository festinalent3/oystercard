class Station

  def initialize name, zone = 1
    @name = name
    @zone = zone
  end

attr_reader :name, :zone 
end
