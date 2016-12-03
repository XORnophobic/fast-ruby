require "benchmark/ips"

def fastest
  "foo".freeze =~ /boo/
end

def faster
  "foo".freeze =~ /boo/
  $~
end

def fast
  /boo/ === "foo".freeze  
end

def slow
  "foo".freeze.match(/boo/)
end

Benchmark.ips do |x|
  x.report("String#=~") { fastest }
  x.report("String#=~ w/ $~") { faster }
  x.report("Regexp#===") { fast }
  x.report("String#match") { slow }
  x.compare!
end
