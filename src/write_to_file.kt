import java.lang.System.`in`
import java.util.*
import Kotlin_recursion.*
import java.io.File
import kotlin.reflect.KFunction
import kotlin.reflect.*

class write_to_file{
    //Получить функцию по имени
    fun func(name: String): KFunction<Int>? {
        val Kotlin_recursion = Kotlin_recursion()
        val funcs = mapOf(
            "nod" to Kotlin_recursion::nod,
            "nod2" to Kotlin_recursion::nod2,
            "min_n" to Kotlin_recursion::min_n,
            "min_n2" to Kotlin_recursion::min_n2,
            "max" to Kotlin_recursion::max,
            "max2" to Kotlin_recursion::max2
        )
        return funcs[name]
    }

    //Считать строки файла
    fun readLines(filename: String): List<String> {
        val lines = mutableListOf<String>()
        File(filename).forEachLine { lines.add(it) }
        return lines
    }

    //Обработка строк
    fun fileProcess(fileName: String){
        var lines = readLines("C:\\Users\\Ростислав\\IdeaProjects\\Kotlin\\src\\" + fileName)
        val outpath="C:\\Users\\Ростислав\\IdeaProjects\\Kotlin\\src\\condition.txt"
        var results = mutableListOf<Int>()
        File(outpath).writeText("")
        for (line in lines) {
            var t = line.split(" ")
            if (t.size == 2) {
                val function = func(t[1])
                if (t[1] == "min_n" || t[1] == "min_n2") {
                    File(outpath).appendText(line+" "+function?.call(t[0].toInt()).toString()+"\n")
                }
                if (t[1] == "max" || t[1] == "max2") {
                    File(outpath).appendText(line+" "+function?.call(t[0].toInt()).toString()+"\n")
                }
            }
            if (t.size == 3){
                val function = func(t[2])
                if (t[2] == "nod" || t[2] == "nod2") {
                    File(outpath).appendText(
                        line + " " + function?.call(t[0].toInt(), t[1].toInt()).toString() + "\n"
                    )
                }
            }
        }
    }
    fun main() {
        val files = write_to_file()
        files.fileProcess("lab6.txt")
    }
}
fun main() = write_to_file().main()