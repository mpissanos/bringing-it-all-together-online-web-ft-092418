class Dog
  attr_accessor :id, :name, :breed
  
  def initialize (hash)
    hash.each {|k,v| self.send("#{k}=", v)}
  end
  
end