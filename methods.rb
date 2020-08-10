if Gem.win_platform?
    Encoding.default_external = Encoding.find(Encoding.locale_charmap)
    Encoding.default_internal = __ENCODING__
  
    [STDIN, STDOUT].each do |io|
      io.set_encoding(Encoding.default_external, Encoding.default_internal)
    end
end

def read
    line = nil
    all = []

    while line != "end" do
        line = STDIN.gets.encode("UTF-8").chomp
        all << line
    end

    all.pop

    return all
end

def write(current, day, time, entry)
    separator = "______________"
    
    file = File.new(current + day, "a:UTF-8")
    file.print("\n\r" + time + "\n\r")

    for line in entry do
        file.puts(line)
    end

    file.puts(separator)
    file.close

    puts "Записано в файл #{day}."
    puts "Время записи: #{time}"
end