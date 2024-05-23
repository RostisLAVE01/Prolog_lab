import java.util.*

class tree(val value: String? = null, var left: tree? = null, var right: tree? = null){

    // Функция для преобразования списка в сортированное двоичное дерево
    fun list_Tree(list: List<String>): tree? {
        if (list.isEmpty()) {
            return null
        }
        val sortedList = list.sortedBy { it.length } // сортировка по длине строки
        return sort(sortedList)
    }

    // Вспомогательная функция для построения дерева
    private fun sort(sortedList: List<String>): tree {
        if (sortedList.isEmpty()) {
            return tree("")
        }
        val middleIndex = sortedList.size / 2
        val node = tree(sortedList[middleIndex])
        node.left = sort(sortedList.subList(0, middleIndex))
        node.right = sort(sortedList.subList(middleIndex + 1, sortedList.size))
        return node
    }

    // Функция для преобразования двоичного дерева в отсортированный список
    fun sort_spicok(root: tree?): List<String> {
        val resultList = mutableListOf<String>()
        if (root != null) {
            val queue: Queue<tree> = LinkedList()
            queue.add(root)
            while (queue.isNotEmpty()) {
                val current = queue.poll()
                if (current.value != null) {
                    resultList.add(current.value)
                }
                if (current.left != null) {
                    queue.add(current.left)
                }
                if (current.right != null) {
                    queue.add(current.right)
                }
            }
        }
        return resultList
    }

    fun main() {
        val stringList = listOf("This is a test", "Hello world", "Kotlin is awesome", "Java is outdated")
        val tree = list_Tree(stringList)
        val sortedList = sort_spicok(tree)
        println(sortedList) // [Java is outdated, Hello world, This is a test, Kotlin is awesome]
    }
}
fun main() = tree().main()

