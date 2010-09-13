class String
  # Truncates the string after the first +chars+ (100) at word boundary and
  # adds +ending+ ("...").
  def truncate_at_word chars=100, ending="..."
    sub(/^(.{#{chars}}[\w.]*)(.*)/m){ $2.empty? ? $1 : $1 + ending}
  end
end

