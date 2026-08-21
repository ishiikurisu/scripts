def add_to_wall_list wl, x, y, w, dw, dh
  wl << {:x => x, :y => y-1} if y > 0 and w[y-1][x]
  wl << {:x => x, :y => y+1} if y < dh and w[y+1][x]
  wl << {:x => x-1, :y => y} if x > 0 and w[y][x-1]
  wl << {:x => x+1, :y => y} if x < dw and w[y][x+1]
  return wl
end

def count_cells b, x, y, w, h
  c = 0

  c += 1 if y > 0 and b[y-1][x]
  c += 1 if y < h and b[y+1][x]
  c += 1 if x > 0 and b[y][x-1]
  c += 1 if x < w and b[y][x+1]

  return c
end

def new_maze width, height
  walls, maze = [], []

  # start with a grid full of walls
  for j in 0..height
    walls << [true] * width
    maze << [false] * width
  end

  # pick a cell and mark it as part of the maze
  maze[0][0] = true
  walls[0][0] = false

  # add walls of the cell the wall list
  wl = add_to_wall_list [], 0, 0, walls, width, height

  # while there are walls in the list
  rng = Random.new
  while wl.length > 0
    # pick a random wall from the list
    wi = rng.rand(wl.length)
    w = wl[wi]

    # if only one of the cells divides is visited, then...
    x, y = w[:x], w[:y]
    c = count_cells maze, x, y, width, height
    if c == 1
      # make  the wall a passage and mark unvisited cell as part of the maze
      walls[y][x], maze[y][x] = false, true
      # add the neighbouring walls of the cell to the wall list
      wl = add_to_wall_list wl, x, y, walls, width, height
    end

    # remove wall from the wall list
    wl.delete_at wi
  end

  return maze
end

def row_to_s  row
  outlet = row.reduce("") do |box, it|
    box += it ? " " : "#"
  end
  return "##{outlet}#"
end

def draw maze
  border = "#" * (2 + maze[0].length)
  puts border
  maze.map{ |row| row_to_s row }.each{ |row| puts row }
  puts border
end

# main [width, height]
def main args
  if args.length != 2
    puts "usage: generate_maze.rb width height"
    return
  end

  width = args[0].to_i
  height = args[1].to_i
  maze = new_maze width, height
  draw maze
end

main ARGV

if __FILE__ == $PROGRAM_NAME
  main ARGV
end

