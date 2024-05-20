import org.junit.jupiter.api.Test
import org.junit.jupiter.api.Assertions.*

class pure_functions_test{
    @Test
    fun nod() {
        val main = pure_function_class()
        val expected=3
        assertEquals(expected,main.nod(3,6))
    }
    @Test
    fun min_n() {
        val main = pure_function_class()
        val expected=3
        assertEquals(expected,main.min_n(253678))
    }
    @Test
    fun max() {
        val main = pure_function_class()
        val expected=9
        assertEquals(expected,main.max(425792345))
    }
}
