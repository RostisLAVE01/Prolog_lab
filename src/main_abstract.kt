import java.io.File

//Считать строки файла
fun readLines(filename: String): List<String> {
    val lines = mutableListOf<String>()
    File(filename).forEachLine { lines.add(it) }
    return lines
}

fun main() {
    val lines = readLines("C:\\Users\\Ростислав\\IdeaProjects\\Kotlin_lab6\\src\\abstract.txt")

    val arrayCollection = ArrayDocumentCollection()
    val listCollection = ListDocumentCollection()
    val binaryListCollection = BinaryListDocumentCollection()
    val hashSetCollection = HashSetDocumentCollection()
    val treeSetCollection = TreeSetDocumentCollection()

    var totalPositiveTimeArray = 0L
    var totalNegativeTimeArray = 0L
    var totalPositiveTimeList = 0L
    var totalNegativeTimeList = 0L
    var totalPositiveTimeBinaryList = 0L
    var totalNegativeTimeBinaryList = 0L
    var totalPositiveTimeHashSet = 0L
    var totalNegativeTimeHashSet = 0L
    var totalPositiveTimeTreeSet = 0L
    var totalNegativeTimeTreeSet = 0L

    for (line in lines) {
        val timeArray = arrayCollection.measureTime { arrayCollection.searchDoc(line) }
        if (timeArray < 0) {
            totalNegativeTimeArray += timeArray
        } else {
            totalPositiveTimeArray += timeArray
        }

        val timeList = listCollection.measureTime { listCollection.searchDoc(line) }
        if (timeList < 0) {
            totalNegativeTimeList += timeList
        } else {
            totalPositiveTimeList += timeList
        }

        val timeBinaryList = binaryListCollection.measureTime { binaryListCollection.searchDoc(line) }
        if (timeBinaryList < 0) {
            totalNegativeTimeBinaryList += timeBinaryList
        } else {
            totalPositiveTimeBinaryList += timeBinaryList
        }

        val timeHashSet = hashSetCollection.measureTime { hashSetCollection.searchDoc(line) }
        if (timeHashSet < 0) {
            totalNegativeTimeHashSet += timeHashSet
        } else {
            totalPositiveTimeHashSet += timeHashSet
        }

        val timeTreeSet = treeSetCollection.measureTime { treeSetCollection.searchDoc(line) }
        if (timeTreeSet < 0) {
            totalNegativeTimeTreeSet += timeTreeSet
        } else {
            totalPositiveTimeTreeSet += timeTreeSet
        }
    }

    val averagePositiveTimeArray = totalPositiveTimeArray / lines.size
    val averageNegativeTimeArray = totalNegativeTimeArray / lines.size
    val averagePositiveTimeList = totalPositiveTimeList / lines.size
    val averageNegativeTimeList = totalNegativeTimeList / lines.size
    val averagePositiveTimeBinaryList = totalPositiveTimeBinaryList / lines.size
    val averageNegativeTimeBinaryList = totalNegativeTimeBinaryList / lines.size
    val averagePositiveTimeHashSet = totalPositiveTimeHashSet / lines.size
    val averageNegativeTimeHashSet = totalNegativeTimeHashSet / lines.size
    val averagePositiveTimeTreeSet = totalPositiveTimeTreeSet / lines.size
    val averageNegativeTimeTreeSet = totalNegativeTimeTreeSet / lines.size

    println("Среднее время положительного ответа в ArrayDocumentCollection: $averagePositiveTimeArray")
    println("Среднее время отрицательного ответа в ArrayDocumentCollection: $averageNegativeTimeArray")
    println("Среднее время положительного ответа в ListDocumentCollection: $averagePositiveTimeList")
    println("Среднее время отрицательного ответа в ListDocumentCollection: $averageNegativeTimeList")
    println("Среднее время положительного ответа в BinaryListDocumentCollection: $averagePositiveTimeBinaryList")
    println("Среднее время отрицательного ответа в BinaryListDocumentCollection: $averageNegativeTimeBinaryList")
    println("Среднее время положительного ответа в HashSetDocumentCollection: $averagePositiveTimeHashSet")
    println("Среднее время отрицательного ответа в HashSetDocumentCollection: $averageNegativeTimeHashSet")
    println("Среднее время положительного ответа в TreeSetDocumentCollection: $averagePositiveTimeTreeSet")
    println("Среднее время отрицательного ответа в TreeSetDocumentCollection: $averageNegativeTimeTreeSet")
}