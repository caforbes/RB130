class Triangle
  def initialize(num_rows)
    @num_rows = num_rows
  end

  def rows
    triangle = [[1]]

    until triangle.size == @num_rows
      last_row = triangle.last
      new_row = []
      (0..last_row.length).each do |index|
        prev_index = index - 1

        prev_num = prev_index < 0 ? 0 : last_row[prev_index]
        current_num = index == last_row.length ? 0 : last_row[index]

        new_row << prev_num + current_num
      end

      triangle << new_row
    end

    triangle
  end
end