#!/opt/ruby/current/bin/ruby
# -*- coding: utf-8 -*-

require 'active_record'
require 'will_paginate'
require 'will_paginate/active_record'

class Content < ActiveRecord::Base
  def self.columns_definition
    {
      :key => :string,
      :value => :string,
      :created_at => :datetime,
      :updated_at => :datetime
    }
  end

  self.per_page = 5
end

class Storage
  def initialize
    prepare_database
  end

  def create
    create_table(model_class)
  end

  def drop
    drop_table(model_class)
  end

  private

  def prepare_database
    ActiveRecord::Base.configurations = YAML.load_file(File.expand_path(File.join(File.dirname(__FILE__),
      '..', 'config', 'database.yml')))
    ActiveRecord::Base.establish_connection(:development)
    create
  end

  def model_class
    Content
  end

  def create_table(target_class)
    ActiveRecord::Migration.create_table(target_class.table_name){|t|
      target_class.columns_definition.each_pair {|column_name, column_type|
        t.column column_name, column_type
      }
    } unless target_class.table_exists?
  end

  def drop_table(target_class)
    ActiveRecord::Migration.drop_table(target_class.table_name) unless target_class.table_exists?
  end
end
