class Dog
  attr_accessor :id, :name, :breed
  
  def initialize (hash)
    hash.each {|k,v| self.send("#{k}=", v)}
  end
  
  def self.create_table
    sql = <<-SQL  
      CREATE TABLE IF NOT EXISTS dogs (
      id INTEGER PRIMARY KEY,
      n)
  
end