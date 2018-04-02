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
