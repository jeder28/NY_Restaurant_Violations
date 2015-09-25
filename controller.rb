require_relative 'model'
require_relative 'view'
class Controller
  def initialize
    @view = View.new
    @model = Model
    run
  end

  def run
    @view.display_message(:hello)
    input = ""
    until input == "quit"
      @view.display_prompt
      input = @view.get_input
      if input.include?("best")
        @view.display_message(:best, @model.get_best(input[5..-1]))
      elsif input.include?("worst")
        @view.display_message(:worst, @model.get_worst(input[6..-1]))
      else
        @view.display_message([])
      end
    end
  end
end

Controller.new
