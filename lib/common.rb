require 'logger'

LOGGER = Logger.new(STDOUT)
LOGGER.formatter = proc do |s, dt, p, msg|
  "#{msg}\n"
end

# Monkeypatching String to include coloring of output and easy insertion of HOME
class String
  def replace_home
    self.gsub(ENV['HOME'], '~')
  end

  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def blue
    colorize(34)
  end

  def green
    colorize(32)
  end
end
