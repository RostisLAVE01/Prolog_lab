import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import org.apache.poi.ss.usermodel.*
import org.apache.poi.xssf.usermodel.XSSFWorkbook
import java.io.File
import java.lang.reflect.Type

// Класс-контейнер для списка объектов
data class DriverContainer(val drivers: List<Driver>)

// Базовый класс - Водитель
open class Driver(val name: String, val age: Int, val licenseType: String, val hireYear: Int) {
    open fun work_experience(): Int {
        return 2024
    }
}

// Класс - Личный водитель
class PersonalDriver(name: String, age: Int, hireYear: Int, licenseType: String, val employer: String) : Driver(name, age, licenseType, hireYear) {
    override fun work_experience(): Int {
        return super.work_experience() - hireYear
    }
}

// Класс - Грузовой водитель
class TruckDriver(name: String, age: Int, hireYear: Int, licenseType: String, val truckType: String) : Driver(name, age, licenseType, hireYear) {
    override fun work_experience(): Int {
        return super.work_experience() - hireYear
    }
}

// Класс - Таксист
class TaxiDriver(name: String, age: Int, hireYear: Int, licenseType: String, val taxiCompany: String) : Driver(name, age, licenseType, hireYear) {
    override fun work_experience(): Int {
        return super.work_experience() - hireYear
    }
}

fun main() {
    val Taxi = TaxiDriver("Калыван", 11, 1, "C", "Как в последний раз")
    val Personal = PersonalDriver("Эчпочмак", 99, 45, "B", "Тимофей")
    val Truck = TruckDriver("Сережа", 56, 24, "D", "Рефрижератор")
    val Truck1 = TruckDriver("Ротибор", 32,8, "D", "прицеп")
    val Taxi1 = TaxiDriver("Саша", 8, 1, "A", "Такси от бога")
    val Personal1 = PersonalDriver("Иванова", 21, 3, "B", "Тимофей")

    val drivers: List<Driver> = listOf(Taxi, Personal, Truck, Truck1, Taxi1, Personal1)

}