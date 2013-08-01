#!/opt/ruby/current/bin/ruby
# -*- coding: utf-8 -*-

require 'active_record'

class Content < ActiveRecord::Base
end

class Storage
  def initialize
    prepare_database
  end

  def create
    create_table unless model_class.table_exists?
  end

  def drop
    drop_table if model_class.table_exists?
  end

  private

  def prepare_database
    db_config = File.expand_path(File.join(File.dirname(__FILE__), 'config', 'database.yml'))
    ActiveRecord::Base.configurations = YAML.load_file(db_config)
    ActiveRecord::Base.establish_connection('development')
    create_table unless model_class.table_exists?
  end

  def model_class
    Content
  end

  def column_definition
    {
      :id => :integer,
      :key => :string,
      :value => :string,
    }
  end

  def unique_key
    :id
  end

  def create_table
    ActiveRecord::Migration.create_table(model_class.table_name){|t|
      column_definition.each_pair {|column_name, column_type|
        t.column column_name, column_type
      }
    }
  end

  def drop_table
    ActiveRecord::Migration.drop_table(model_class.table_name)
  end
end
