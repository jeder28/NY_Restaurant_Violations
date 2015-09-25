
class View

  MESSAGES = {
    hello: <<-HELLO,
Hello, welcome to NY Violations Report!
Commands available:
  'quit' => Exit program
  'best' => Find those with least/no violations.
  'worst' => Find those with most violations.
    HELLO
    quit: "\nWe hope you enjoyed your restaurant violations report!",
    best: "\nHere are the top 10 most tolerable places\n----------",
    worst: "\nHere are the top 10 places run away from as if it were a zombie apocalypse\n----------",
    cities: "\nHere are the top 10 locations that are closest to your restaurant search\n----------"
  }

  def get_input
    STDIN.gets.chomp
  end

  def display_prompt
    print ">"
  end

  def display_message(message_id, list_ary=[])
    puts MESSAGES.fetch(message_id) { raise ArgumentError, "Message not found: #{message_id}" }
    if list_ary.empty? && !(message_id == :hello || message_id == :quit)
      puts "empty information"
    else
      display_list(list_ary)
    end
  end

  def display_list(list_ary)
    return if list_ary.empty?
    puts "Name".ljust(40, ' ')+"Critical Unfixed Violations".rjust(28, ' ')+"Critical Violations".rjust(23, ' ')+"Noncritical Violations".rjust(26, ' ')
    # most_keys_header.each_key { |column_key| print "#{column_key} " }
    list_ary.each { |restaurant| puts restaurant }
  end

  def clear_screen
    puts "\e[H\e[2J"
  end
end
