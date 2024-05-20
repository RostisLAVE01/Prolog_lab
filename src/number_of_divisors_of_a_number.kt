//Вариант № 11 Найти количество делителей числа, не делящихся на 3
//Найти сумму всех делителей числа, взаимно простых с суммой цифр числа и не
//взаимно простых с произведением цифр числа.
import java.util.*
import kotlin.math.sqrt
class number_of_divisors_of_a_number{


    fun sumDigits(n: Int): Int {
        var sum = 0
        var temp = n
        while (temp > 0) {
            sum += temp % 10
            temp /= 10
        }
        return sum
    }

    fun productDigits(n: Int): Int {
        var product = 1
        var temp = n
        while (temp > 0) {
            product *= temp % 10
            temp /= 10
        }
        return product
    }

    fun gcd(a: Int, b: Int): Int {
        return if (b == 0) a else gcd(b, a % b)
    }

    fun sumDivisors(n: Int): Pair<Int, Int> {
        var sum = 0
        var count = 0
        val sumDigits = sumDigits(n)
        val productDigits = productDigits(n)
        val sqrt = sqrt(n.toDouble()).toInt()

        for (i in 1..sqrt) {
            if (n % i == 0) {
                val divisor1 = i
                val divisor2 = n / i
                if (gcd(sumDigits, divisor1) == 1 && gcd(productDigits, divisor1) != 1) {
                    sum += divisor1
                    if (n % 3 != 0) {
                        count++
                    }
                }
                if (divisor1 != divisor2 && gcd(sumDigits, divisor2) == 1 && gcd(productDigits, divisor2) != 1) {
                    sum += divisor2
                    if (n % 3 != 0) {
                        count++
                    }
                }
            }
        }

        // Проверка на случай, когда само число n удовлетворяет условию
        if (gcd(sumDigits, n) == 1 && gcd(productDigits, n) != 1) {
            sum += n
            if (n % 3 != 0) {
                count++
            }
        }

        return Pair(sum, count)
    }

    fun main() {
        val scanner = Scanner(System.`in`)
        val x: Int = scanner.nextInt()
        println(sumDivisors(x))
    }
}
fun main() = number_of_divisors_of_a_number().main()