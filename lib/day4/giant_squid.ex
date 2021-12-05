defmodule AOC.Day4.GiantSquid do
  def part1(boards, numbers) do
    [number | numbers] = numbers
    changed_boards = change_boards(boards, number)

    case Enum.find(changed_boards, &check_win/1) do
      nil -> part1(changed_boards, numbers)
      board -> (board |> Enum.filter(&is_integer/1) |> Enum.sum) * number
    end
  end

  def part2(input, numbers) do
    part2_helper(input, {[], nil}, numbers)
  end

  def part2_helper(_boards, {boards_won, number}, []) do
    [board | _] = boards_won
    (board |> Enum.filter(&is_integer/1) |> Enum.sum) * number
  end
  def part2_helper(boards, {boards_won, current_number}, numbers) do
    [number | numbers] = numbers
    changed_boards = change_boards(boards, number)
    boards_won = [Enum.find(changed_boards, &check_win/1) | boards_won] |> Enum.reject(&is_nil/1)
    new_boards = Enum.reject(changed_boards, &check_win/1)

    if length(new_boards) == length(boards) do
      part2_helper(new_boards, { boards_won, current_number }, numbers)
    else
      part2_helper(new_boards, { boards_won, number }, numbers)
    end

  end

  def change_boards(boards, number) do
    boards |> Enum.map(fn board ->
      Enum.map(board, fn x ->
        if x == number do
          "X"
        else
          x
        end
      end)
    end)
  end

  def check_win(board) do
    check_row1(board) ||
      check_row2(board) ||
      check_row3(board) ||
      check_row4(board) ||
      check_row5(board) ||
      check_column1(board) ||
      check_column2(board) ||
      check_column3(board) ||
      check_column4(board) ||
      check_column5(board)
  end

  def check_row1(board) do
    idx = [0, 1, 2, 3, 4]
    Enum.all?(idx, fn i -> Enum.at(board, i) == "X" end)
  end
  def check_row2(board) do
    idx = [5, 6, 7, 8, 9]
    Enum.all?(idx, fn i -> Enum.at(board, i) == "X" end)
  end
  def check_row3(board) do
    idx = [10, 11, 12, 13, 14]
    Enum.all?(idx, fn i -> Enum.at(board, i) == "X" end)
  end
  def check_row4(board) do
    idx = [15, 16, 17, 18, 19]
    Enum.all?(idx, fn i -> Enum.at(board, i) == "X" end)
  end
  def check_row5(board) do
    idx = [20, 21, 22, 23, 24]
    Enum.all?(idx, fn i -> Enum.at(board, i) == "X" end)
  end

  def check_column1(board) do
    idx = [0, 5, 10, 15, 20]
    Enum.all?(idx, fn i -> Enum.at(board, i) == "X" end)
  end
  def check_column2(board) do
    idx = [1, 6, 11, 16, 21]
    Enum.all?(idx, fn i -> Enum.at(board, i) == "X" end)
  end
  def check_column3(board) do
    idx = [2, 7, 12, 17, 22]
    Enum.all?(idx, fn i -> Enum.at(board, i) == "X" end)
  end
  def check_column4(board) do
    idx = [3, 8, 13, 18, 23]
    Enum.all?(idx, fn i -> Enum.at(board, i) == "X" end)
  end
  def check_column5(board) do
    idx = [4, 9, 14, 19, 24]
    Enum.all?(idx, fn i -> Enum.at(board, i) == "X" end)
  end
end
