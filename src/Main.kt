import java.util.*
import java.lang.Math.abs
import java.lang.System.`in`
import kotlin.collections.HashSet


val scanner = Scanner(`in`)

fun vvodd(n: Int, m: MutableList<Int>) {
    if (n>0) {
        m.add(scanner.nextInt())
        vvodd(n-1, m)
    }
}
fun vvod(n: Int):MutableList<Int> {
    val m:MutableList<Int> = mutableListOf()
    vvodd(n, m)
    return m
}

tailrec fun arrayOP(m: MutableList<Int>,i: Int, a: Int = 0, f: (Int, Int) -> Int): Int =
    if (i <= 0) a else arrayOP(m,i-1, f(a, m[i-1]), f)

fun sumd(m: MutableList<Int>): Int = arrayOP(m, m.size, 0) { a, b -> (a + b) }
fun muld(m: MutableList<Int>): Int = arrayOP(m, m.size, 1) { a, b -> (a * b) }
fun maxd(m: MutableList<Int>): Int = arrayOP(m, m.size, m[0]) { a, b -> if (a > b) a else b }
fun mind(m: MutableList<Int>): Int = arrayOP(m, m.size, m[0]) { a, b -> if (a < b) a else b }

fun freq(m: MutableList<Int>): Int
{
    if (m.isNotEmpty()) {
        val map: MutableMap<Int, Int> = mutableMapOf()
        for (x in m) map[x] = map.getOrDefault(x, 0) + 1
        var k = 1
        var e: Int = map.values.first()
        for (x in map) if (x.value > k) {
            k = x.value
            e = x.key
        }
        return e
    } else return 0
}

fun new2freq(m: MutableList<Int>): MutableList<Int>
{
    if (m.isNotEmpty()) {
        val n:MutableList<Int> = mutableListOf()
        val map: MutableMap<Int, Int> = mutableMapOf()
        for (x in m) map[x] = map.getOrDefault(x, 0) + 1
        for (x in map) if ((x.key % 2 == 0) and (x.value % 2 == 0)) n.add(x.key)
        return n
    } else return mutableListOf()
}

fun newlist(m: MutableList<Int>): MutableList<Int>
{
    if (m.isNotEmpty()) {
        val n:MutableList<Int> = mutableListOf()
        for (x in m) if ((x < 0) and (Main2().sumc(abs(x)) < 10)) n.add(x)
        return n
    } else return mutableListOf()
}

fun main() {

    val m: MutableList<class_carv> = mutableListOf()
    val u1=class_carv("AG","897609","14.05.2020")
    val u2=class_carv("FK","125456","01.12.2021")
    val u3=class_carv("BN","124905","30.06.2020")
    val u4=class_carv("QA","567842","01.01.2020")
    val u5=class_carv("QA","567842","01.01.2020")
    m.add(u1)
    m.add(u2)
    m.add(u3)
    m.add(u4)
    for (x in m)x.write()
    println("--------Сортировка элементов----------")
    m.sort()
    for (x in m)x.write()
    println("------------HashSet--------------------")
    val h: HashSet<class_carv> = hashSetOf()
    h.add(u1)
    h.add(u2)
    h.add(u3)
    h.add(u4)
    h.add(u5)
    for (x in h)x.write()


    println(h.contains(class_carv("AB", "123456", "01.01.2020")))
    println(h.contains(class_carv("EF", "789012", "01.01.2021")))

    val Date = TreeSet<class_carv>(compareBy { it.issueDate })
    Date.addAll(m)
    println("------------Отсортированныйе по дате--------------------")
    for (pass in Date) {
        pass.write()
    }

    val Series_Number = TreeSet<class_carv>(compareBy({ it.series }, { it.number }))
    println("------------Отсортированныйе по серии и номеру--------------------")
    Series_Number.addAll(m)
    for (i in Series_Number) {
        i.write()
    }
}