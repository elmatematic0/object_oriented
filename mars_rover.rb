


# N = 0
# E = 1
# S = 2
# W = 3




def left
    
    if input_direction == -1 && position == 0
    position = 3
    else
    position -= 1
  end

end

def right
    if input_direction == R && position == 3
    position = 0
    else
      position += 1
  end
end

