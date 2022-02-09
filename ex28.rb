
=begin

if you use <, >, <=, >= operators with strings, they are not comparing the string characters, but the number of characters.

1: true && true -> true
2: false && true -> false
3: 1 == 1 && 2 == 1 -> false
4: "test" == "test" -> true
5: 1 == 1 || 2 != 1 -> true
6: true && 1 == 1 -> true
7: false && 0 != 0 -> false
8: true || 1 == 1 -> true
9:"test" == "testing" -> false
10: 1 != 0 && 2 == 1 -> false
11: "test" != "testing" -> true
12: "test" == 1 -> false
13: !(true && false) -> true
14: !(1 == 1 && 0 != 1) -> false
15: !(10 == 1 || 1000 == 1000) -> false
16: !(1 != 10 || 3 == 4) -> false
17: !("testing" == "testing" && "Zed" == "Cool Guy") -> true
18: 1 == 1 && (!("testing" == 1 || 1 == 0)) -> true
19: "chunky" == "bacon" && (!(3 == 4 || 3 == 3) -> false
20: 3 == 3 && (!("testing" == "testing" || "Ruby" == "Fun")) -> false

=end

=begin

== equal
!= not equal
> greater than
< less than
<= less or equal
>= greater or equal

<=> combined comparison
     x <=> y  , returns: -1(x<y), 0(x=y), 1(x>y) or nil(if x cannot be compared to y)

=== test equality
    x === y ,  (10...20) === 9 equals false, but (10...20) === 15 equals true

.eql? True if two values are equal and of the same type.
    x.eql? y , 1 == 1.0 is true, BUT 1.eql? 1.0 is FALSE because it is not the same type.

.equal? True if two things are the same object.
    ob1.equal?obj2

=~ used to match string and symbols against regex patterns. http://www.zenruby.info/2016/05/ruby-operators-equality-comparison.html
!~ used to match strings and symbols against regex patterns. http://www.zenruby.info/2016/05/ruby-operators-equality-comparison.html



=end
