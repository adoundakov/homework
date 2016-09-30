require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    matches = params.values
    where_items = params.keys.map { |k,_| "#{k} = ?" }

    result = DBConnection.execute(<<-SQL, *matches)
    SELECT * FROM #{self.table_name}
    WHERE #{where_items.join(' AND ')}
    SQL

    return result if result.empty?
    parse_all(result)
  end
end

class SQLObject
  extend Searchable
end
