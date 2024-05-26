class ArrayDocumentCollection : DocumentCollection<String>() {
    private val documents = arrayOf("AG897609", "AF803457", "AH942875", "AJ499390", "AQ797609", "AL545132", "AM897991", "AZ587206")

    override fun searchDoc(doc: String) {
        val series = doc.substring(0, 2)
        val number = doc.substring(2)

        val time = measureTime {
            if (validateSeriesNumber(series, number) && documents.contains(doc)) {
                println("Document with series $series and number $number found in ArrayDocumentCollection")
            } else {
                println("Document with series $series and number $number not found in ArrayDocumentCollection")
            }
        }
        // Сохранить время для дальнейшего подсчета среднего
    }

    private fun validateSeriesNumber(series: String, number: String): Boolean {
        val seriesNumberRegex = "[A-Z]{2}\\d{6}".toRegex()
        return seriesNumberRegex.matches(series + number)
    }
}
class ListDocumentCollection : DocumentCollection<String>() {
    private val documents = listOf("AG897609", "AF803457", "AH942875","AJ499390","AQ797609","AL545132","AM897991","AZ587206")

    override fun searchDoc(doc: String) {
        val series = doc.substring(0, 2)
        val number = doc.substring(2)

        val time = measureTime {
            if (validateSeriesNumber(series, number) && documents.contains(doc)) {
                println("Document with series $series and number $number found in ArrayDocumentCollection")
            } else {
                println("Document with series $series and number $number not found in ArrayDocumentCollection")
            }
        }
        // Сохранить время для дальнейшего подсчета среднего
    }

    private fun validateSeriesNumber(series: String, number: String): Boolean {
        val seriesNumberRegex = "[A-Z]{2}\\d{6}".toRegex()
        return seriesNumberRegex.matches(series + number)
    }
}
class BinaryListDocumentCollection : DocumentCollection<String>() {
    private val documents = listOf("AG897609", "AF803457", "AH942875","AJ499390","AQ797609","AL545132","AM897991","AZ587206").sorted()
    var totalSearchTime: Long = 0 // переменная для сохранения времени выполнения метода searchDoc
    override fun searchDoc(doc: String) {
        val time = measureTime {
            if (validateDoc(doc)) {
                val index = documents.binarySearch(doc)
                if (index >= 0) {
                    println("Document $doc found in BinaryListDocumentCollection")
                } else {
                    println("Document $doc not found in BinaryListDocumentCollection")
                }
            } else {
                println("Invalid document format")
            }
        }
        totalSearchTime += time// Сохранить время для дальнейшего подсчета среднего
    }

    private fun validateDoc(doc: String): Boolean {
        val docRegex = "[A-Z]{2}\\d{6}".toRegex()
        return docRegex.matches(doc)
    }
}
class HashSetDocumentCollection : DocumentCollection<String>() {
    private val documents = hashSetOf("AG897609", "AF803457", "AH942875","AJ499390","AQ797609","AL545132","AM897991","AZ587206")

    override fun searchDoc(doc: String) {
        val series = doc.substring(0, 2)
        val number = doc.substring(2)

        val time = measureTime {
            if (validateSeriesNumber(series, number) && documents.contains(doc)) {
                println("Document with series $series and number $number found in ArrayDocumentCollection")
            } else {
                println("Document with series $series and number $number not found in ArrayDocumentCollection")
            }
        }
        // Сохранить время для дальнейшего подсчета среднего
    }

    private fun validateSeriesNumber(series: String, number: String): Boolean {
        val seriesNumberRegex = "[A-Z]{2}\\d{6}".toRegex()
        return seriesNumberRegex.matches(series + number)
    }
}
class TreeSetDocumentCollection : DocumentCollection<String>() {
    private val documents = sortedSetOf("AG897609", "AF803457", "AH942875","AJ499390","AQ797609","AL545132","AM897991","AZ587206")

    override fun searchDoc(doc: String) {
        val series = doc.substring(0, 2)
        val number = doc.substring(2)

        val time = measureTime {
            if (validateSeriesNumber(series, number) && documents.contains(doc)) {
                println("Document with series $series and number $number found in ArrayDocumentCollection")
            } else {
                println("Document with series $series and number $number not found in ArrayDocumentCollection")
            }
        }
        // Сохранить время для дальнейшего подсчета среднего
    }

    private fun validateSeriesNumber(series: String, number: String): Boolean {
        val seriesNumberRegex = "[A-Z]{2}\\d{6}".toRegex()
        return seriesNumberRegex.matches(series + number)
    }
}