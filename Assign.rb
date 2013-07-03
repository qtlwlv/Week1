array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


array.each { |a| print a, " "}
puts

g_5 = array.select { |b| b > 5}
g_5.each { |b| print b, " "}
puts

array2 = Array.new
odd_num = g_5.select {|odd_num| odd_num %2 != 0}
array2.push odd_num
puts array2

array.push 11
array.unshift 0
array.each { |a| print a, " "}
puts

array.map! { |x| x==11 ? 3 : x }
array.each { |a| print a, " "}
puts

array = array.uniq
array.each { |a| print a, " "}
puts

#Arrays are ordered, integer-indexed collections of any oject.
#Hash is a collection of key-value pairs. Similar to array
#except indexing is done via keys of any oject type.

ruby_old = {'new' => 'ad', 'old' => 'bc'}
ruby_new = { new:'ad', old:'bc'}
puts ruby_old ['old']
puts ruby_new [:new]

hash = {a:1, b:2, c:3, d:4}
puts hash [:a]


hash[:e]=5
puts hash

hash.each_value {|value| puts value if value < 3.5}

#??? I think so

# Honestly the best source has been google.  It seems 
#there are 3 main sites it keeps referring to though;
#stackoverflow, tuturialspoint, ruby-doc.org
# Being a complete newbie, I do not think one site really
#states/explains all in layman terms.  One site better
#explains x while another site better explains y.
# By layman terms I mean even simple words
# describing what to do (i.e iterate, enumerate) is 
# programming everyday lingo.  They really are not
# everyday words used by the public.  
# So it takes time to get mind wrapped around
# quesion or description sometimes.  Rambling now, but
# I get amuzed as every professional field I know
# of has its own language within public language.  










