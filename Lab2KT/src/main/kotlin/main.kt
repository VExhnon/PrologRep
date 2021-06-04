import kotlin.math.abs

fun main() {
    val number = inputNumber()

    // task 1
     println("Sum of digits (recursion up): ${sumDigitsUp(number)}")

    // task 2
    // println("Sum of digits (tail recursion): ${sumDigitsTail(number)}")

    // task 3.1
    // println("Exp of digits (recursion up): ${expDigitsUp(number)}")

    // task 3.1
    // println("Exp of digits (tail recursion): ${expDigitsTail(number)}")

    // task 3.2
    // println("Min digit (recursion up): ${minDigitUp(number)}")

    // task 3.2
    // println("Min digit (tail recursion): ${minDigitTail(number)}")

    // task 3.3
    // println("Max digit (recursion up): ${maxDigitUp(number)}")

    // task 3.3
    // println("Max digit (tail recursion): ${maxDigitTail(number)}")

    // task 4
    //println("\nSum of digits: ${calculate(number, ::sumDigitsUp)}")
    //println("Exp of digits: ${calculate(number, ::expDigitsUp)}")
    //println("Min digit: ${calculate(number, ::minDigitUp)}")
    // println("Max digit: ${calculate(number, ::maxDigitUp)}")

    // task 6: проверить функцию task 5

    // 1-ый и 2-ой пример: считает сумму цифр, если каждая из них больше 5
    //calculateWithCondition(number, ::sumDigitsTail, ::checkDigits)
    //calculateWithCondition(number, ::sumDigitsTail, ::checkDigits, 0)

    // 3-ий пример: считает произведение цифр, если каждая из них больше 5
    //  calculateWithCondition(number, ::expDigitsTail, ::checkDigits, 1)


   // task 8
   // launchMenu(number)
   //}


}

// ввод числа
fun inputNumber(): Int {
    print("Enter the number:> ")
    val number = readLine()!!.toString()

    return try {
        number.toInt()
    }
    catch (e: NumberFormatException) {
        inputNumber()
    }
}

// task 1: сумма цифр числа (рекурсия вверх)
fun sumDigitsUp(number: Int): Int =
    if (number / 10 == 0)
        abs(number % 10)
    else
        sumDigitsUp(number / 10) + abs(number % 10)

// task 2: сумма цифр числа (хвостовая рекурсия)
fun sumDigitsTail(number: Int, sum: Int): Int =
    if (number / 10 == 0)
        sum + abs(number % 10)
    else
        sumDigitsTail(number / 10, sum + abs(number % 10))

fun sumDigitsTail(number: Int): Int =
    sumDigitsTail(number, 0)

// task 3.1: проиведение цифр числа (рекурсия вверх)
fun expDigitsUp(number: Int): Int =
    if (number / 10 == 0)
        abs(number % 10)
    else
        expDigitsUp(number / 10) * abs(number % 10)

// task 3.1: произведение цифр числа (хвостовая рекурсия)
fun expDigitsTail(number: Int, exp: Int): Int =
    if (number / 10 == 0)
        exp * abs(number % 10)
    else
        expDigitsTail(number / 10, exp * abs(number % 10))

fun expDigitsTail(number: Int): Int =
    expDigitsTail(number, 1)

// task 3.2: минимальная цифра числа (рекурсия вверх)
fun minDigitUp(number: Int): Int {
    val newNumber = number / 10
    val digit = abs(number % 10)

    return if (newNumber != 0) {
        val min = minDigitUp(newNumber)
        if (digit < min)
            digit
        else min
    }
    else digit
}

// task 3.2: минимальная цифра числа (хвостовая рекурсия)
fun minDigitTail(number: Int): Int {
    fun minDigitTail(number: Int, min: Int): Int {
        val newNumber = number / 10
        val digit = abs(number % 10)

        val newMin =
            if (digit < min)
                digit
            else min

        return if (newNumber != 0)
            minDigitTail(newNumber, newMin)
        else newMin
    }
    return minDigitTail(number, 10)
}

// task 3.3: максимальная цифра числа (рекурсия вверх)
fun maxDigitUp(number: Int): Int {
    val newNumber = number / 10
    val digit = abs(number % 10)

    return if (newNumber != 0) {
        val max = maxDigitUp(newNumber)
        if (digit > max)
            digit
        else max
    }
    else digit
}

// task 3.3: максимальная цифра числа (хвостовая рекурсия)
fun maxDigitTail(number: Int): Int {
    fun maxDigitTail(number: Int, max: Int): Int {
        val newNumber = number / 10
        val digit = abs(number % 10)

        val newMax =
            if (digit > max)
                digit
            else max

        return if (newNumber != 0)
            maxDigitTail(newNumber, newMax)
        else newMax
    }
    return maxDigitTail(number, -1)
}

// task 4: функция обход числа, которая принимает число,
// функцию и инициализирующее значение по умолчанию (!)
fun calculateNumber(number: Int, func: (number: Int) -> Int, initValue: Int = 0): Int =
    func(number)

// task 5: функция обход числа, которая принимает число,
// функцию с двумя аргументами Int, инициализирующее заполнение
// и функцию c одним аргументом Int, возврщающую true-false (условие для цифр)
fun calculateWithCondition(number: Int, funCalculate: (number: Int, value: Int) -> Int, funCondition: (number: Int) -> Boolean, initValue: Int = 0) {
    if (funCondition(number))
        println("Function result: ${funCalculate(number, initValue)}")
    else
        println("Sorry: digits don't satisfy the condition!")
}

// проверка, все ли цифры в числе чётные
fun checkDigits(number: Int): Boolean =
    if (number % 10 == 0) {
        if (number / 10 == 0)
            true
        else
            checkDigits(number / 10)
    }
    else false


// task 8: модифицировать возможность пользователя выполнять
// одну из нескольких операций над числами, введя функцию op,
// возвращающую функцию с одним аргументом
fun op(choice: String?): (Int) -> Int =
    when(choice) {
        "1" -> ::sumDigitsTail
        "2" -> ::expDigitsTail
        "3" -> ::minDigitTail
        "4" -> ::maxDigitTail
        else -> throw IllegalArgumentException("Invalid function number")
    }

fun launchMenu(number: Int) {
    println("\nWhich of the functions do you want to do?\n")

    println("0: exit")
    println("1: sumDigitsTail")
    println("2: ExpDigitsTail")
    println("3: minDigitTail")
    println("4: maxDigitTail")
    println("5: maxPrimeDivisor\n")

    print("Enter the function number:> ")
    val choice = readLine()

    if (choice == "0")
        return

    try {
        println("Function result: ${op(choice)(number)}")
    }
    catch(e: IllegalArgumentException) {
        println("Error: ${e.message}! Try again!")
    }

    launchMenu(number)
}