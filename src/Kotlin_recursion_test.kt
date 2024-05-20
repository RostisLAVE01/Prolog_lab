import org.junit.jupiter.api.Test
import org.junit.jupiter.api.Assertions.*

class Kotlin_recursion_test{
    @Test
    fun nod() {
        val main = Kotlin_recursion()
        val expected=10
        assertEquals(expected,main.nod(30,20))
    }
    @Test
    fun nod2() {
        val main = Kotlin_recursion()
        val expected=10
        assertEquals(expected,main.nod2(30,20))
    }
    @Test
    fun min_n() {
        val main = Kotlin_recursion()
        val expected=3
        assertEquals(expected,main.min_n(253678))
    }
    @Test
    fun min_n2() {
        val main = Kotlin_recursion()
        val expected=3
        assertEquals(expected,main.min_n2(253678))
    }
    @Test
    fun max() {
        val main = Kotlin_recursion()
        val expected=9
        assertEquals(expected,main.max(425792345))
    }
    @Test
    fun max2() {
        val main = Kotlin_recursion()
        val expected=9
        assertEquals(expected,main.max2(425792345))
    }
}