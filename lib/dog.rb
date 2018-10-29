class Dog
  attr_accessor :name, :breed
  
  def initialize (hash)
    hash.each {|k,v|}
  end
  
end