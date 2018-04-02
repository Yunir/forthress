: .n . cr ;
: inc 1 + ;
: abs dup 0 < if -1 * then ;
: odd 2 % abs ;
: even odd not ;
( 42 even . 43 even . 0 even . -1 even . -2 even . cr )
: sqr dup * ;
: rdrop r> drop ;
: rinc r> 1 + >r ;
: prime
dup 1 > if
dup 2 = not if
dup odd if
1 swap 3 repeat 2dup sqr <=
else drop 0 then
else drop 1 then
else drop 0 then ;
