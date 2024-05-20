import java.util.*
import kotlin.math.pow

class pentagonalNumber{
    fun isPentagonal(num: Int): Boolean {
        val n = (1 + (1 + 24 * num).toDouble().pow(0.5)) / 6
        return n % 1 == 0.0
    }

    fun pentagonalNumber(n: Int): Int {
        return n * (3 * n - 1) / 2
    }

    fun osnova() {
        var minD: Int? = null
        var pair: Pair<Int, Int>? = null

        for (i in 1 until 10000) {
            for (j in i + 1 until 10000) {
                val p1 = pentagonalNumber(i)
                val p2 = pentagonalNumber(j)
                if (isPentagonal(p1 + p2) && isPentagonal(Math.abs(p1 - p2))) {
                    if (minD == null || Math.abs(p1 - p2) < minD) {
                        minD = Math.abs(p1 - p2)
                        pair = Pair(p1, p2)
                    }
                }
            }
        }

        println("Пара пентагональных чисел с минимальной разностью D: $pair")
        println("Значение D: $minD")
    }
    fun main() {
        println(osnova())
    }
}
fun main() = pentagonalNumber().main()