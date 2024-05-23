import java.util.Scanner

class tuples{

    //Реализовать функцию, которая по трем спискам составляет список, состоящий из
    //кортежей длины 3, где каждый кортеж (ai,bi,ci) с номером I получен следующим образом:
    //Ai – I по убыванию элемент первого списка
    //Bi – I по возрастанию суммы цифр элемент второго списка
    //Сi - I по убыванию количества делителей элемент третьего списка
    //Все элементы одного списка различны.
    //Если в списках B или C два элемента имеют одинаковый коэффициент, большим считается
    //элемент, больший по абсолютной величине.
    fun createTupleList(list1: List<Int>, list2: List<Int>, list3: List<Int>): List<Triple<Int, Int, Int>> {
        val sortedList1 = list1.sorted().reversed()
        val sortedList2 = qust(list2)
        val sortedList3 = count(list3).reversed()

        return sortedList1.mapIndexed { index, a ->
            Triple(a, sortedList2[index], sortedList3[index])
        }
    }

    fun sumOfDigits(num: Int): Int {
        return num.toString().sumOf { it.digitToInt() }
    }

    fun qust(list: List<Int>): List<Int> {
        return list.sortedBy{qust2(it)}
        }
    fun qust2(num: Int): Int{
        return if (num < 10) {
            num
        } else {
            num % 10 + sumOfDigits(num / 10)
        }
    }

    fun count(list: List<Int>): List<Int> {
        return list.sortedBy{count2(it)}
    }
    fun count2(num: Int, count: Int = 2, z: Int = 0): Int {
        return if (count > num / 2) {
            z + if (num % count == 0) 1 else 0
        } else {
            count2(num, count + 1, z + if (num % count == 0) 1 else 0)
        }
    }

    //Реализовать функцию, которая для данного списка указывает, сколько элементов из
    //него могут быть квадратом какого-то из элементов списка.
    fun countSquares(num: List<Int>): Int {
        val square = num.map { Math.sqrt(it.toDouble()) }
        return countSquares2(num, square, 0)
    }

    fun countSquares2(num: List<Int>, square: List<Double>, index: Int): Int {
        if (index == num.size) {
            return 0
        }
        return if (square[index].toInt() * square[index].toInt() == num[index]) {
            1 + countSquares2(num, square, index + 1)
        } else {
            countSquares2(num, square, index + 1)
        }
    }

    //Вариант 11 Задачи 11, 2, 14, 20, 25, 34
    //1.11 Дан целочисленный массив, в котором лишь один элемент отличается от
    //остальных. Необходимо найти значение этого элемента.
    fun otlin(num: List<Int>) = otlin2(num,1,0)

    fun otlin2(num: List<Int>, count: Int,otvet: Int): Int {
        if (num.isEmpty()) return 0

        var srav = num[0]
        var result = otvet

        if (count < num.size) {
            if (srav != num[count] && count < num.size - 1) {
                if (srav == num[count + 1]) {
                    result = num[count]
                } else {
                    result = srav
                }
            }
            else{
                if (srav != num[count] && count > 1 && count == num.size - 1) {
                    if (num[count] == num[count - 1])
                        result = srav
                    else
                        result = num[count]
                }
            }
        }

        return if (count == num.size - 1)
            result
        else
            otlin2(num, count + 1,result)
    }

    //1.2 Дан целочисленный массив. Необходимо найти индекс минимального элемента.
    fun min_el(num: List<Int>) = min_el2(num,0,1,num[0])

    fun min_el2(num: List<Int>,otvet: Int,index: Int,promit: Int): Int{
        var pmeg = promit
        var otvet2 = otvet
        if (pmeg > num[index])
            otvet2 = index + 1
            pmeg = num[index]
        return if (index == num.size - 1)
            otvet2
        else
            min_el2(num, otvet2,index + 1, pmeg)
    }

    //1.14 Дан целочисленный массив и интервал a..b. Необходимо найти количество
    //элементов в этом интервале.
    fun interval(num: List<Int>, a: Int, b: Int) = interval2(num,a,b,0,0)

    fun interval2(num: List<Int>, a: Int,b: Int,count: Int,index: Int): Int{
        var count2 = count
        if (count2 > 0)
            count2 += 1
        if (num[index] == a)
            count2 += 1
        return if (num[index] != b)
            interval2(num, a, b, count2, index + 1)
        else
            count2
    }

    //1.20 Дан целочисленный массив. Необходимо найти все пропущенные числа.
    fun popysk(num: List<Int>) = popysk2(num,0,0, mutableListOf<Int>())

    fun popysk2(num: List<Int>, sh: Int,index: Int,otvet: MutableList<Int>): List<Int>{
        var sh2 = sh
        if(index < num.size - 1) {
            if ((num[index] + 1) < num[index + 1] && sh2 == 0) {
                sh2 = num[index + 1] - 1
                otvet.add(sh2)
            }
        }
        if ((num[index] + 1) < sh2 && sh2 > 0){
            sh2 -= 1
            otvet.add(sh2)
        }
        return if (index == num.size - 1)
            otvet
        else {
            if ((num[index] + 1) < sh2)
                popysk2(num, sh2, index, otvet)
            else
                popysk2(num, 0, index + 1, otvet)
        }
    }

    //1.25 Дан целочисленный массив и интервал a..b. Необходимо найти максимальный
    //из элементов в этом интервале.
    fun interval_max(num: List<Int>, a: Int, b: Int) = interval_max2(num,a,b,0,0)

    fun interval_max2(num: List<Int>, a: Int,b: Int,max: Int,index: Int): Int{
        var max2 = max
        if (index == a) {
            max2 = num[a]
        }
        if (num[index] > max2 && max2 > 0) {
            max2 = num[index]
        }
        return if (index == num.size - 1)
            max2
        else
            interval_max2(num, a, b, max2, index + 1)
    }

    //1.34Дан целочисленный массив и отрезок a..b. Необходимо найти элементы,
    //значение которых принадлежит этому отрезку.
    fun interval_list(num: List<Int>, a: Int,b: Int) = interval_list2(num, a, b, mutableListOf<Int>(),0)

    fun interval_list2(num: List<Int>, a: Int,b: Int,otvet: MutableList<Int>,index: Int): List<Int>{
        if (otvet.size > 0)
            otvet.add(num[index])
        if(index == a)
            otvet.add(num[index])
        return if(index != b)
            interval_list2(num,a,b,otvet,index+1)
        else
            otvet
    }

    //1.41 Дан целочисленный массив. Найти среднее арифметическое модулей его элементов.

    fun main() {
        val scanner = Scanner(System.`in`)
        println("Введите элементы 1 списка (через пробел):")
        val list1 = scanner.nextLine().split(" ").map { it.toInt() }
        //println("Введите элементы 2 списка (через пробел):")
        //val list2 = scanner.nextLine().split(" ").map { it.toInt() }
        //println("Введите элементы 3 списка (через пробел):")
        //val list3 = scanner.nextLine().split(" ").map { it.toInt() }
        //val a = scanner.nextInt()
        //val b = scanner.nextInt()
        println(countSquares(list1))
    }
}
fun main() = tuples().main()