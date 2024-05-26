

abstract class DocumentCollection<Doc> {
    abstract fun searchDoc(doc: Doc)
    fun measureTime(action: () -> Unit): Long {
        val startTime = System.currentTimeMillis()
        action()
        val endTime = System.currentTimeMillis()
        return endTime - startTime
    }
}