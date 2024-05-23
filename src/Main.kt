import java.util.*

fun main() {
    val passport1 = class_carv("FG", "723456", "01.01.2020")
    val passport2 = class_carv("CD", "654321", "01.05.2019")

    passport1.write()
    passport2.write()

    val passportSet = hashSetOf(passport1, passport2)
    println(passportSet.contains(class_carv("AB", "123456", "01.01.2020")))
    println(passportSet.contains(class_carv("EF", "789012", "01.01.2021")))

    val Date = TreeSet<class_carv>(compareBy { it.issueDate })
    Date.addAll(listOf(passport1, passport2))
    println(Date)
    for (pass in Date) {
        pass.write()
    }

    val Series_Number = TreeSet<class_carv>(compareBy({ it.series }, { it.number }))
    Series_Number.addAll(listOf(passport1, passport2))
    println(Series_Number)
    for (i in Series_Number) {
        i.write()
    }
}