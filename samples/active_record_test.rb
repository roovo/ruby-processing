# by Rupert Voelcker
# 
# This assumes that you have set up the database.yml file correctly
# and that the database it is configure with contains a table called
# nodes which contains at least one record.

require 'ruby-processing'

class Sketch < Processing::App
  
  load_ruby_library "active_record_for_processing"
  
  def setup
    hint(ENABLE_NATIVE_FONTS)
    font = create_font("Arial", 20)
    text_font font
    
    @node = Node.find :first
    no_loop
  end

  def draw
    background 0
    fill 255
    text(@node.inspect, 20, 20)
  end
end

class Node < ActiveRecord::Base
end

Sketch.new(:width => 800, :height => 100, :title => "Active Record Demo")
