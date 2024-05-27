package com.example

import io.ktor.http.*
import io.ktor.server.application.*
import io.ktor.server.response.*
import io.ktor.server.routing.*

fun Application.configureRouting() {

    val drive=SerJson("drivers.json")
    routing {


        get("/") {
            call.respondText("Hello World!")
        }
        // Наиболее часто встречающаяся класс прав
        get("/getdriver_license") {
            val text= getdriver_license(drive)
            val type = ContentType.parse("text/html")
            call.respondText(text, type)
        }

        // Старший сотрудник
        get("/getSenior_employee") {
            val text= getSenior_employee(drive)
            val type = ContentType.parse("text/html")
            call.respondText(text, type)
        }

        // Процент со стражем больше 5 лет
        get("/Percentage_with_guard_for_more_than_5_years") {
            val text= Percentage_with_guard_for_more_than_5_years(drive)
            val type = ContentType.parse("text/html")
            call.respondText(text, type)
        }

        // Процент со стражем больше 5 лет
        get("/Percentage_with_guard_for_more_than_5_years") {
            val text= Percentage_with_guard_for_more_than_5_years(drive)
            val type = ContentType.parse("text/html")
            call.respondText(text, type)
        }

        // Процент людей с категорией прав B и старше 25
        get("/driving_license_category_B_and_over_25") {
            val text= driving_license_category_B_and_over_25(drive)
            val type = ContentType.parse("text/html")
            call.respondText(text, type)
        }

        // Средний стаж работы
        get("/Average_work_experience") {
            val text= Average_work_experience(drive)
            val type = ContentType.parse("text/html")
            call.respondText(text, type)
        }
    }
}

