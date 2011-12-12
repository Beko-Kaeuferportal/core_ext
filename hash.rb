# -*- encoding : utf-8 -*-
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

  def deep_merge(other_hash)
    a = self.dup
    other_hash.each do |k, v|
      if v.is_a? Hash
        if a.has_key? k
          a[k] = a[k].deep_merge(v)
        else
          a[k] = v
        end
      else
        a[k] = v
      end
    end
    a
  end

end

