class String
  # Truncates the string after the first +chars+ (100) at word boundary and
  # adds +ending+ ("...").
  def truncate_at_word chars=100, ending="..."
    sub(/^(.{#{chars}}[\w.]*)(.*)/m){ $2.empty? ? $1 : $1 + ending}
  end

  # returns a url/ascii/old-systems/non-utf8 friendly representation of self
  def callname
    @_callname ||= dup.
      gsub(/[Ää]+/i,'ae').
      gsub(/[Üü]+/i,'ue').
      gsub(/[Öö]+/i,'oe').
      gsub(/[ß]+/i,'ss').
      downcase.
      gsub(/[^a-z0-9]+/i, '-').
      gsub(/(^[-]+|[-]+$)/, '')
  end

  def to_bool
    return true if match('true')
    return false
  end
end

