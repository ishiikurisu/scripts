#!/usr/bin/env ruby

require "yaml"

def roc(k, q)
  w = 0.0
  for x in k..q
    w += 1.0 / x
  end
  return w / q
end

def criteria_to_weights criteria
  # assuming ROC right now
  q = criteria.length
  w = {}
  criteria.each_index do |k|
    c = criteria[k]
    w[c] = roc(k + 1, q)
  end
  return w
end

def preference(option_a, option_b, weights, comparisons)
  pi = 0.0
  q = weights.length
  weights.each do |criteria, weight|
    f_a = q - comparisons[criteria].find_index(option_a) + 1
    f_b = q - comparisons[criteria].find_index(option_b) + 1
    pi += weight * (f_a - f_b)
  end
  return pi
end

def positive_flow(option, options, weights, comparisons)
  p = options.length
  phi = 0.0
  options.each_index do |x|
    option_x = options[x]
    phi += preference(option, option_x, weights, comparisons)
  end
  return phi / p
end

def negative_flow(option, options, weights, comparisons)
  p = options.length
  phi = 0.0
  options.each_index do |x|
    option_x = options[x]
    phi += preference(option_x, option, weights, comparisons)
  end
  return phi / p
end

def promethee options, weights, comparisons
  flows = {}
  options.each do |option|
    phi_plus = positive_flow(option, options, weights, comparisons)
    phi_minus = negative_flow(option, options, weights, comparisons)
    flows[option] = phi_plus - phi_minus
  end
  return flows
end

def pretty_print(flows)
  data = flows.sort do |a, b|
    b[1] <=> a[1]
  end

  puts "---"
  puts "flows:"
  data.each do |k ,v|
    puts "- option: #{k}"
    puts "  flow: #{v}" 
  end
end

def main input_file
  inlet = nil
  File.open(input_file) do |fp|
    inlet = YAML.load fp.read
  end
  config = inlet["meta"]
  criteria = inlet["criteria"]
  options = inlet["options"]
  comparisons = inlet["comparisons"]

  weights = criteria_to_weights criteria
  flows = promethee options, weights, comparisons

  pretty_print(flows)
end

if __FILE__ == $0
  main ARGV[0]
end
