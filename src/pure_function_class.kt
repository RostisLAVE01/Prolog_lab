import java.lang.System.`in`
import java.util.*
class pure_function_class {

    //Вариант № 11
//Найти максимальную цифру числа.
//Найти минимальную нечетную цифру числа.
//Найти НОД двух чисел.
    //Найти НОД двух чисел.
    fun nod(a: Int,b: Int): Int  {
        var x = a
        var y = b
        while (y != 0) {
            val temp = y
            y = x % y
            x = temp
        }
        return x
    }

    //Найти минимальную нечетную цифру числа.
    fun min_n(x: Int): Int{
        var x1 = x
        var f = 9
        while (x1 !=0) {
            if((x1 % 10 < f) and (1 == x1 % 2))
                f = x1 % 10
            x1/=10
        }
        return f
    }

    //Найти максимальную цифру числа.
    fun max(x: Int): Int{
        var x1 = x
        var f = 0
        while (x1 !=0) {
            if (x1 % 10 > f)
                f = x1 % 10
            x1/=10
        }
        return f
    }

    fun main() {
        val scanner = Scanner(`in`)
        val x: Int = scanner.nextInt()
        val y: Int = scanner.nextInt()
        println(nod(x,y))
    }
}
fun main() = pure_function_class().main()