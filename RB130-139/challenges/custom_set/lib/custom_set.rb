class CustomSet
  def initialize(set=[])
    @elements = set.uniq
  end

  def empty?
    elements.empty?
  end

  def contains?(query)
    elements.include?(query)
  end

  def subset?(other)
    elements.all? { |elt| other.contains?(elt) }
  end

  def disjoint?(other)
    elements.none? { |elt| other.contains?(elt) }
  end

  def eql?(other)
    return false unless elements.size.==(other.elements.size)
    subset?(other)
  end

  def ==(other_set)
    eql?(other_set)
  end

  def add(el)
    elements.push(el) unless contains?(el)
    self
  end

  def intersection(other)
    CustomSet.new(elements.select { |elt| other.contains?(elt) })
  end

  def difference(other)
    CustomSet.new(elements.select { |elt| !other.contains?(elt) })
  end

  def union(other)
    CustomSet.new(elements + other.elements)
  end

  protected

  attr_accessor :elements
end
