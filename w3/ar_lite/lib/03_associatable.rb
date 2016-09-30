require_relative '02_searchable'
require 'active_support/inflector'

# Phase IIIa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )

  def model_class
    class_name.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    if options[:primary_key]
      @primary_key = options[:primary_key]
    else
      @primary_key = :id
    end

    if options[:foreign_key]
      @foreign_key = options[:foreign_key]
    else
      @foreign_key = "#{name}_id".to_sym
    end

    if options[:class_name]
      @class_name = options[:class_name]
    else
      @class_name = "#{name}".camelcase
    end
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    if options[:primary_key]
      @primary_key = options[:primary_key]
    else
      @primary_key = :id
    end

    if options[:foreign_key]
      @foreign_key = options[:foreign_key]
    else
      @foreign_key = "#{self_class_name.downcase}_id".to_sym
    end

    if options[:class_name]
      @class_name = options[:class_name]
    else
      @class_name = "#{name}".singularize.camelcase
    end
  end
end

module Associatable
  # Phase IIIb
  def belongs_to(name, options = {})
    options = BelongsToOptions.new(name, options)
    define_method(name) do
      f_val = send(options.foreign_key)
      result = DBConnection.execute(<<-SQL, f_val)
      SELECT * FROM #{self.class.table_name} WHERE #{options.primary_key} = ?
      SQL
      result.first
    end
  end

  def has_many(name, options = {})
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase IVa. Modify `belongs_to`, too.
  end
end

class SQLObject
  # Mixin Associatable here...
  extend Associatable
end
