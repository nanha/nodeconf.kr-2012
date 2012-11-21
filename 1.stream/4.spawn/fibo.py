# -*- encoding: utf-8 -*-

import sys

def fib(n):
  if n == 0:
    return 0
  elif n == 1:
    return 1
  else:
    a = fib(n-1)
    print a
    b = fib(n-2)
    print b
    return a + b

if __name__ == '__main__':
  a = (int)(sys.argv[1])
  print fib(a)
