# Author: Rupert Voelcker
# Date: 1st Sept 2008
# 
# This is needed as some parts of ActiveSupport and ActiveRecord attempt to 
# require rubygems which will fail miserably from within ruby-processing (and anyway
# we want to keep things self-contained in processing).
# 
# So this is a dummy rubygem library which raises the correct errors to allow
# ActiveSupport and ActiveRecord to load successfully

module Gem
  class LoadError < RuntimeError ; end
end

def gem(*args)
  if args[0].index("activerecord-") == 0
    raise LoadError
  else
    raise Gem::LoadError
  end
end