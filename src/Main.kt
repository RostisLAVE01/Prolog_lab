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


    // Задание 2
    // Создаем объект класса-контейнера с указанным списком объектов
    val container = DriverContainer(drivers)

    // Сериализуем класс-контейнер в JSON
    val gson = Gson()
    val json = gson.toJson(container)

    // Сохраняем JSON в файл
    val filePath = "drivers.json"
    File(filePath).writeText(json)

    // Десериализация объектов из файла
    val jsonContent = File(filePath).readText()
    val type: Type = object : TypeToken<DriverContainer>(){}.type
    val deserializedContainer: DriverContainer = gson.fromJson(jsonContent, type)

    // Получаем список объектов из класса-контейнера
    val drive: List<Driver> = deserializedContainer.drivers

    // Задание 4
    val results = mutableListOf<String>()

    // Наиболее часто встречающаяся класс прав
    val rights = drive.maxByOrNull { it.licenseType }
    if (rights != null) {
        val rights_class = "Категория водительских прав: ${rights.licenseType}, Имя водителя: ${rights.name}, Возраст: ${rights.age}"
        results.add(rights_class)
    } else {
        results.add("Список пуст")
    }

    // Старший сотрудник
    val old = drive.maxByOrNull { it.age }
    if (old != null) {
        val old_drive = "Возраст: ${old.age}, Имя водителя: ${old.name}, Категория водительских прав: ${old.licenseType}"
        results.add(old_drive)
    } else {
        results.add("Список пуст")
    }


}
