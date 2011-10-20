File.open(ARGV[0], "r") do |infile|
  while (line = infile.gets)
    m = /%%(.*?)%%/.match line
    print line.gsub /%%(.*?)%%/, m.nil?? "" : ENV[m[1]]
  end
end
