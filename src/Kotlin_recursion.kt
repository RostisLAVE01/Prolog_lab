import java.util.*

class Kotlin_recursion {
   // Построить 6 функции, решающих задачи предыдущего задания с помощью рекурсии вверх
   // и хвостовой рекурсии.
   //Найти НОД двух чисел. Рекурсия вверх.
   fun nod(a: Int,b: Int): Int  {
       return if ((a % b) == 0) b else nod(b, a % b)
   }

    //Найти НОД двух чисел. Хвостовой рекурсией.
    fun nod2(a: Int, b: Int): Int = nod22(a, b, 0)

    private fun nod22(a: Int, b: Int, acc: Int): Int {
        return if (b == 0) acc + a
        else nod22(b, a % b, acc)
    }

    //Найти минимальную нечетную цифру числа. Рекурсия вверх.
    fun min_n(num: Int): Int {
        if (num == 0) return Int.MAX_VALUE // возвращаем максимальное значение Int, если число равно 0

        val lastDigit = num % 10
        if (lastDigit % 2 != 0) { // если последняя цифра нечетная
            val minOfRest = min_n(num / 10) // находим минимальную нечетную цифру в остальных цифрах
            return if (lastDigit < minOfRest) lastDigit else minOfRest // возвращаем минимальную из двух
        } else {
            return min_n(num / 10) // если последняя цифра четная, проверяем следующую цифру
        }
    }

    //Найти минимальную нечетную цифру числа. Хвостовой рекурсией.
    fun min_n2(x: Int): Int = min_n22(x, 9)
   private fun min_n22(x: Int, f: Int): Int = if(x/10==0) f  else if((x % 10 < f) and (1 == x % 2)) min_n22(x/10,x%10) else min_n22(x/10,f)



    //Найти максимальную цифру числа. Рекурсия вверх.
    fun max(x: Int): Int{
        if (x < 10) {
            return x
        }
        else {
            val x1 = x % 10
            val f = x / 10
            return maxOf(x1, max(f))
        }
    }

    //Найти максимальную цифру числа. Хвостовой рекурсией.
    fun max2(x: Int): Int = max22(x,0)

    private fun max22(x: Int, t: Int): Int=
        if(x < 10)
            t
        else{
            if(x%10 > t)
                max22(x/10,x%10)
            else
                max22(x/10,t)
        }

    //функций высшего порядка для одного аргумента
    fun one(x:Int,f:(Int)->Int):Int = f(x)

    //функций высшего порядка для двух аргумента
    fun two(x: Int,b: Int,f:(Int,Int)->Int):Int = f(x,b)

    fun main() {
        val scanner = Scanner(System.`in`)
        val x: Int = scanner.nextInt()
        val y: Int = scanner.nextInt()
        println(two(x,y,::nod))
    }
}
fun main() = Kotlin_recursion().main()