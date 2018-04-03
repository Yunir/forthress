: .n . cr ;
: inc 1 + ;
: abs dup 0 < if -1 * then ;
: odd 2 % abs ;
: even odd not ;
( 42 even . 43 even . 0 even . -1 even . -2 even . -- 10101 )

: .s . ."  " ;
: .2 dup .s swap dup .s swap ;
: sqr dup * ;
: prime
dup 1 > if
  dup 2 = not if
    dup odd if
    1
      repeat
      2 +
      2dup 2dup sqr >=
      -rot % land not ( i+=2; until N < i^2 && N % i != 0 )
      until
    sqr <
    else drop 0 then
  else drop 1 then
else drop 0 then ;
( 2 prime . 11 prime . 191 prime . 201 prime . -- 1110)

: primeallot prime 8 allot swap over ! ;
( 5 primeallot c@ .n )

: dec 1 - ;
: concat
swap dup count >r over count r@
+ inc heap-alloc
dup rot string-copy
r> over >r +
swap string-copy r>
;
( m" Hello " m" world!" concat .S dup prints m" another string" over prints )

( m" Salimzyanov" string-hash 3 % .n )

: collatz ( xn -- xn xn-1 ... x3 x2 x1 xn )
dup >r
repeat
  dup 1 > if
    dup 2 % if
    dup 3 * inc
    else dup 2 / then
  else 1 then
dup 1 = until
r> ;
(  )
: .until ( xn xn-1 ... x3 x2 x1 xn -- - )
  >r
  repeat
    dup .s
    r@ =
  until
cr r> drop ;
 ( 5 collatz .until )
 ( -2 collatz .until )
 ( check stack does not change )
 ( 999 5 collatz .until .n )
 ( 999 -2 collatz .until .n )
