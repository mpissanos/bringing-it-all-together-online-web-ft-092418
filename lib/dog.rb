class Dog
  attr_accessor :id, :name, :breed
  
  def initialize (hash)
    hash.each {|k,v| self.send("#{k}=", v)}
  end
  
  def self.create_table
    sql = <<-SQL  
      CREATE TABLE IF NOT EXISTS dogs (
      id INTEGER PRIMARY KEY,
      name TEXT,
      breed TEXT)
      SQL
      
      DB[:conn].execute(sql)
    end
    
    def self.drop_table
      sql = <<-SQL 
        DROP TABLE IF EXISTS dogs
        SQL
      
      DB[:conn].execute(sql)
    end
    
    def save
      if self.id
        self.update
      else
        sql = <<-SQL
          INSERT INTO dogs (name , breed)
          VALUES ( ? , ? )
        SQL
        
        DB[:conn].execute(sql , self.name , self.breed)
        
        @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
      end
      self
    end
      
      def self.create(hash)
        self.new(hash)
        self.save
      end
        
        
        
        
        
        
        
        
        
  
end