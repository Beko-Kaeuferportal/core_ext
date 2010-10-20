class Array
  def uniq_by
    hash, array = {}, []
    each { |i| hash[yield(i)] ||= (array << i) }
    array
  end

  def sum
    inject(nil) { |sum,x| sum ? sum + x : x }
  end

  def mean
    sum / size
  end

end