import java.util.regex.Pattern
import java.util.Date

class class_carv(val series: String, val number: String, val issueDate: String) {
    //Паспорт транспортного средства.

    fun write() {
        println(
            "Паспорт транспортного средства\n" +
                    "Серия : $series\n" +
                    "Номер : $number\n" +
                    "Дата: $issueDate\n"
        )
    }

    init {
        require(validateSeriesNumber(series, number)) { "Invalid series or number format" }
        require(validateDate(issueDate)) { "Invalid date format" }
    }

    override fun equals(other: Any?): Boolean = if (other is class_carv) {
        (series == other.series) &&
                (number == other.number) &&
                (issueDate == other.issueDate)
    } else false


    override fun hashCode(): Int {
        var result = series.hashCode()
        result = 31 * result + number.hashCode()
        result = 31 * result + issueDate.hashCode()
        return result
    }

    companion object {
        private const val Number = "[A-Z]{2}\\d{6}"
        private const val date = "\\d{2}\\.\\d{2}\\.\\d{4}"

        private fun validateSeriesNumber(series: String, number: String): Boolean {
            val Num_Pat = Pattern.compile(Number)
            return Num_Pat.matcher(series + number).matches()
        }

        private fun validateDate(date: String): Boolean {
            val dat_Pat = Pattern.compile(date)
            return dat_Pat.matcher(date).matches()
        }
    }
}