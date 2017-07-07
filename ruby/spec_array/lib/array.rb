# Class Array
class ArrayCRUD
  attr_reader :items

  def initialize
    @items = []
  end

  def create(*arg)
    arg.map { |argument| @items << argument }
  end

  def delete(arg)
    @items.delete(arg)
  end

  def show(arg)
    @items.include?(arg) ? arg : nil
  end

  def update(arg, new_arg)
    @items.include?(arg) ? @items[@items.index(arg)] = new_arg : nil
  end

  def items_sort
    @items.sort!
  end

  def items_reverse
    @items.reverse!
  end
end
