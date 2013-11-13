import math
from datetime import datetime

def invoke_calculation(precision=1000000000000000000000000000000000000000000000000000000):
    start = datetime.now()
    print("PI = ",calculate(precision))
    end = datetime.now()
    print(end - start)

def newton_sqrt(n, prec):
     precision = 10**16
     x = (int(precision * math.sqrt(float((n * precision) // prec) / precision)) * prec) // precision
     n_prec = n * prec
     while(True):
         x_old = x
         x = (x + n_prec // x) // 2
         if x == x_old:
             break
     return x

def calculate(precision=1000000000000000000000000000000000000000000000000000000):
    k = 1
    a_k = precision
    a_sum = precision
    b_sum = 0
    k_1 = 545140134
    k_2 = 13591409
    k_3 = 640320
    k_3_3_24 = k_3**3 // 24
    while a_k != 0:
        a_k *= -(6*k-5)*(2*k-1)*(6*k-1)
        a_k //= k*k*k*k_3_3_24
        a_sum += a_k
        b_sum += k * a_k
        k += 1
    total = k_2 * a_sum + k_1 * b_sum
    pi = (426880*newton_sqrt(10005*precision, precision)*precision) // total
    return pi