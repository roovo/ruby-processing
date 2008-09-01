# Author: Rupert Voelcker
# Date: 1st September 2008
# 
# Sets up active record for use in processing

# set up the load paths
require 'pathname'
AR_LIBRARIES = ["activesupport/lib", "activerecord/lib" ]
this_library_path = File.dirname(__FILE__)
full_root_path    = Pathname.new(this_library_path).realpath.to_s
load_paths = AR_LIBRARIES.map { |dir| "#{full_root_path}/#{dir}" }.select { |dir| File.directory?(dir) }
load_paths.reverse_each { |dir| $LOAD_PATH.unshift(dir) if File.directory?(dir) }
$LOAD_PATH.unshift(this_library_path)

# require the libraries
require 'active_support'
require 'active_record'

# set up the database connection
database_configuration_file = File.join(full_root_path, 'config', 'database.yml')
database_configuration = YAML::load(IO.read(database_configuration_file))
ActiveRecord::Base.establish_connection(database_configuration)
