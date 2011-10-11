module Enumerable
  def mean
    sum / size
  end

  # returns a new hash/array
  # keeps object references in tact
  # symbolize a hash recursivly
  # if we encounter an array, we will also call symbolize for every hash or array found
  def symbolize_keys_rec
    if is_a?(Hash)
      inject({}) do |options, (key, value)|
        options[(key.to_sym rescue key) || key] = (value.is_a?(Hash)||value.is_a?(Array)) ? value.symbolize_keys_rec : value
        options
      end
    elsif is_a?(Array)
      inject([]) do |options, value|
        options << ((value.is_a?(Hash)||value.is_a?(Array)) ? value.symbolize_keys_rec : value)
        options
      end
    else
      raise Exception.new("Can't do that!")
    end
  end
end