module Yaml_tools # by @manwithcode
  require 'yaml'

  def Yaml_tools.write output_file_name, variable
    output_file = File.new output_file_name, "w"
    output_file.puts YAML.dump variable
    output_file.close
  end

  def Yaml_tools.read input_file_name
    input_file = File.new input_file_name, "r"
    variable = YAML.load input_file.read
    return variable
  end
end

class App
  def initialize
    @list = 'app.yml'
    @options = []

    @options = Yaml_tools.read @list
    # p @options
    launch(choose())
  end

  def choose
    i = 1
    possibilities = []

    puts "# which one do you want?"
    @options.each do |option|
      possibilities << option[1]
      puts "#{i}. #{option[0]}"
      i += 1
    end

    answer = Integer(gets.chomp)

    if answer == 0
      exit
    else
      return possibilities[answer-1]
    end
  end

  def launch app
    system "#{app} &"
  end
end

App.new
