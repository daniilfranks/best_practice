# ruby
def reg_base?(param)
  /\A[aeoiu]/ =~ param ? true : false
end

# asd_word
def reg_scan(param)
  param.scan(/asd_\w+/)
end

# abc12
def reg_five(param)
  param.scan(/\b\w{5}/)
end
