begin
  require 'irb/completion'
  require 'rubygems'
  require 'wirble'
  Wirble.init
  colors = Wirble::Colorize.colors.merge({
    :open_hash  => :light_gray,
    :close_hash => :light_gray,
    :open_array => :light_gray,
    :close_array => :light_gray,
    :refers => :light_gray,
    :comma => :light_gray,
    :open_object => :dark_gray,
    :close_object => :dark_gray,
    :object_class => :light_green,
    :object_addr_prefx => :dark_gray,
    :object_addr => :dark_gray,
    :object_line => :light_green,
    :symbol_prefix => :light_red,
    :symbol => :light_red,
    :open_string => :purple,
    :close_string => :purple,
    :string => :purple,
    :number => :light_purple,
    :range => :light_purple,
    :keyword => :light_green,
    :class => :light_green,
  })
  Wirble::Colorize.colors = colors
  Wirble.colorize

  IRB.conf[:USE_READLINE] = true
  IRB.conf[:PROMPT_MODE] = :SIMPLE
  IRB.conf[:AUTO_INDENT] = true
rescue LoadError => err
  warn "Couldn't load Wirble: #{err}"
end

