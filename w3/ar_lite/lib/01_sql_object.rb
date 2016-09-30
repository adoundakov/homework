require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    table_hash = DBConnection.execute2(<<-SQL)
      SELECT * FROM #{self.table_name}
    SQL

    @columns = table_hash.first.map { |e| e.to_sym }
  end

  def self.finalize!
    columns.each do |col|
      define_method("#{col}=") { |v| attributes[col] = v }
      define_method(col) { attributes[col]}
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= "#{self}".tableize
  end

  def self.all
    contents = DBConnection.execute(<<-SQL)
    SELECT #{self.table_name}.* FROM #{self.table_name}
    SQL

    parse_all(contents)
  end

  def self.parse_all(results)
    results.map { |result| new(result) }
  end

  def self.find(id)
    record = DBConnection.execute(<<-SQL, id)
      SELECT * FROM #{self.table_name} WHERE id = ?
    SQL

    new(record)
  end

  def initialize(params = {})
    params.each do |attr_name, val|
      attr_name = attr_name.to_sym
      unless self.class.columns.include?(attr_name)
        raise "unknown attribute '#{attr_name}'"
      end

      send("#{attr_name}=", val)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
  end

  def insert
  end

  def update
  end

  def save
  end
end
