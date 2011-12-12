# -*- encoding : utf-8 -*-
class HashWithIndifferentAccess
  def self.deep_transform hash
    a = HashWithIndifferentAccess.new(hash)
    a.each do |k, v|
      if v.is_a? Hash
        v = deep_transform(v)
      end
    end
    a
  end
end
