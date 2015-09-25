class View

  MESSAGES = {
    hello: <<-HELLO,
Hello, welcome to NY Violations Report!
Commands available:
  'quit' => Exit program
  'best' => Find those with least/no violations.
  'worst' => Find those with most violations.
  'cities' => Find nearest match by name in a certain city.
  then include restaurant name as accurate as possible:
  "best McDonald's"
    HELLO
    quit: "\nWe hope you enjoyed your restaurant violations report!",
    best: "\nHere are the top 10 most tolerable places\n----------",
    worst: "\nHere are the top 10 places run away from as if it were a zombie apocalypse\n----------",
    cities: "\nHere are the top 10 locations that are closest to your restaurant search\n----------"
  }

  def get_input
    STDIN.gets.chomp
  end

  def display_message(message_id, list_ary_hashes)
    puts MESSAGES.fetch(message_id) {raise ArgumentError, "Message not found: #{message_id}"}
    list_ary_hashes.is_a?(Array) ? display_list(list_ary_hashes) : false
  end

  def display_list(list_ary_hashes)
    list_ary_hashes.first.each_key { |column_key| print "#{column_key} " }
    list_ary_hashes.each do |hash|
      print "\n"
      hash.each_value { |row_value| print "#{row_value} " }
    end
    print "\n"
  end

  def clear_screen
    puts "\e[H\e[2J"
  end
end
