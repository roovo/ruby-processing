module ActiveRecordForProcessing
  class GitRails
    def fetch_from_rails
      abort_if_directories_exist
      
      get_rails_2_1_0
      copy_activesupport_activerecord
      remove_rails

      puts "*** activesupport and activerecord installed ***"
    end
    
    def clean
      directories.each do |directory|
        system "rm -rf #{directory}"
      end
    end
    
    private
    
    def abort_if_directories_exist
      existing = directories.select { |directory| File.exist?(directory) }
      unless existing.empty?
        puts "cannot install files if the following directories exist: " + existing.join(", ")
        exit 1
      end
    end
    
    def get_rails_2_1_0
      puts "** Fetching rails"
      system "git clone git://github.com/rails/rails.git rails"

      puts "*** Checking out version 2.1.0"
      system "cd rails ; git checkout -q v2.1.0 ; cd .."
    end
    
    def copy_activesupport_activerecord
      puts "*** Copying ActiveSupport and ActiveRecord"
      system "mv -f rails/activesupport/ ."
      system "mv -f rails/activerecord/ ."
    end
    
    def remove_rails
      puts "*** Removing rails directory"
      system "rm -rf rails"
    end
    
    def directories
      ['rails', 'activesupport', 'activerecord']
    end
  end
end
