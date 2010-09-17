class Hash
  def has_nested_key?(key)
    return true if has_key?(key)
    values.select{|v| v.is_a?(Hash)}.each do |value|
      return value.has_nested_key?(key)
    end
    return false
  end

  def nested_key(key)
    return fetch(key) if has_key?(key)
    values.select{|v| v.is_a?(Hash)}.each do |value|
      return value.nested_key(key)
    end
    return default(key)
  end
end

