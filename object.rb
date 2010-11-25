module CallerMethodName

  private

  def current_method
    caller[0] =~ /\d:in `([^']+)'/
    $1
  end

  def caller_method_name
      parse_caller(caller(2).first).last
  end

  def parse_caller(at)
    if /^(.+?):(\d+)(?::in `(.*)')?/ =~ at
      file = Regexp.last_match[1]
      line = Regexp.last_match[2].to_i
      method = Regexp.last_match[3]
      [file, line, method]
    end
  end

end

Object.__send__(:include, CallerMethodName)