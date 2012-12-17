require 'irb/completion'
require 'irb/ext/save-history'

# Tell irb how much it should remember and where
# to save it's history
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

# Simple prompt
IRB.conf[:PROMPT_MODE]  = :SIMPLE

# Auto indent code
IRB.conf[:AUTO_INDENT]  = true

# list an objects local methods
def local_methods(obj=self)
  (obj.methods - obj.class.superclass.instance_methods).sort
end

# ls an objects methods
def ls(obj=self)
  width = `stty size 2>/dev/null`.split(/\s+/, 2).last.to_i
  width = 80 if width == 0
  local_methods(obj).each_slice(3) do |meths|
    pattern = "%-#{width / 3}s" * meths.length
    puts pattern % meths
  end
end


class Object
  def local_methods
    (self.methods - self.class.superclass.instance_methods).sort
  end
end

bundler_support = ENV['BUNDLER'].to_s.downcase
if %w{true t yes y 1}.include?(bundler_support)
  require 'rubygems'
  require 'bundler'
  Bundler.require
end

if defined? ActiveRecord
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end
