package com.example
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
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



// Функция для записи результатов запросов в файл Excel
fun writeQueryResultsToExcel(queryResults: List<String>, filePath: String) {
    // Создаем новую рабочую книгу Excel
    val workbook = XSSFWorkbook()

    // Создаем новый лист
    val sheet = workbook.createSheet("Query Results")

    // Создаем заголовок столбца
    val headerRow = sheet.createRow(0)
    val headerCell = headerRow.createCell(0)
    headerCell.setCellValue("Результаты запросов")

    // Заполняем данные о результатах запросов
    for ((index, result) in queryResults.withIndex()) {
        val row = sheet.createRow(index + 1)
        val cell = row.createCell(0)
        cell.setCellValue(result)
    }

    // Автоматически подгоняем ширину столбца по содержимому
    sheet.autoSizeColumn(0)

    // Сохраняем рабочую книгу в файл
    val outputStream = File(filePath).outputStream()
    workbook.write(outputStream)
    workbook.close()

    println("Результаты запросов сохранены в файл: $filePath")
}



fun main() {
    val Taxi = TaxiDriver("Калыван", 11, 1, "C", "Как в последний раз")
    val Personal = PersonalDriver("Эчпочмак", 99, 45, "B", "Тимофей")
    val Truck = TruckDriver("Сережа", 56, 24, "D", "Рефрижератор")
    val Truck1 = TruckDriver("Ротибор", 32,8, "D", "прицеп")
    val Taxi1 = TaxiDriver("Саша", 8, 1, "A", "Такси от бога")
    val Personal1 = PersonalDriver("Иванова", 21, 3, "B", "Тимофей")
    val Truck2 = TruckDriver("Ратибор", 28, 24, "D", "Рефрижератор")
    val Truck3 = TruckDriver("Кирилл", 18,15, "D", "прицеп")
    val Taxi2 = TaxiDriver("Маша", 65, 8, "A", "Такси от бога")
    val Personal2 = PersonalDriver("Виталий", 71, 6, "B", "Тимофей")

    val drivers: List<Driver> = listOf(Taxi, Personal, Truck, Truck1, Taxi1, Personal2,Truck2,Truck3,Taxi2)


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

    // Задание 5

    // Процент со стражем больше 5 лет
    val experience = (drive.count { it.hireYear > 5 }.toDouble() / drive.size) * 100
    val intermediate1 = "%.1f".format(experience)
    val Percent1 = "Процент со стражем больше 5 лет: $intermediate1%"
    results.add(Percent1)

    // Процент людей с категорией прав B и старше 25
    val category_of_rights = drive.filter { it.licenseType == "B" }
    val intermediate2 = (category_of_rights.count { it.age > 25 }.toDouble() / category_of_rights.size) * 100
    val Percent2 = "Процент людей с категорией прав B и старше 25: $intermediate2%"
    results.add(Percent2)

    // Средний стаж работы
    val Average_length_of_service = drive.filter { it.licenseType == "D" }.map {it.hireYear}.average()
    val Percent3 = "Средний стаж работы: $Average_length_of_service"
    results.add(Percent3)

    for (result in results) {
        println(result)
    }

    // Задание 6
    val excelFilePath = "drivers_results.xlsx"
    writeQueryResultsToExcel(results, excelFilePath)
}
