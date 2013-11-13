val step = 0.000000001
var x = step
var y = 1.0
val start = System.currentTimeMillis()
while( x < 1.0 ) {
     y += 2.0 * scala.math.sqrt(1.0 - (x * x))
     x += step
 }
y *= step / 2.0
var pi = 4.0 * y
val end = System.currentTimeMillis()
println("PI = "+pi)
println("PI (scala) = "+scala.math.Pi)
println("Delta = "+ (pi - scala.math.Pi))
println("Time: "+(end - start)+" ms")
