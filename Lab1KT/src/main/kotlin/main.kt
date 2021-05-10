import java.io.BufferedReader
import java.io.FileReader
import java.util.*
import java.io.FileWriter
fun main (args: Array<String>) {
   /*// First task
    println("Hello world")


    //Second task // complete

    //third task

    print("Введите ваше имя:")
    var name = readLine()


    println("Привет, ${name}!")
    println("Привет, %s!".format(name))
    println("Привет " + name + "!")
    println("Привет,\n${name}\n!")


    //Задание 4 Рассмотреть методы класса String, включить в отчет половину
    //методов.

    val dog = "Sharik"
    val character = dog[2]
    println(character) // вывод третей буквы слова

    for(char in dog) print("$char ")
    println()

    for(char in dog.toCharArray()) print("$char ")
    println()

    dog.forEach { char -> print(char) }

    dog.forEachIndexed{index, char -> println("Index $index Character $char")}
    println()

    val index = 5
    println("Character at index $index in $dog is ${dog[index]}")

    val multipleStringLines = """
    У лукоморья дуб зелёный;
    Златая цепь на дубе том:
    И днём и ночью кот учёный
    Всё ходит по цепи кругом;
    Идёт направо - песнь заводит,
    Налево - сказку говорит. """

    multipleStringLines.forEach { char -> print(char) }

    println(dog.reversed())
    println(dog.take(2))
    println(dog.takeLast(2))

    val dogmail = "sharik@yandex.com"
    println(dogmail.substringBefore("."))

    //Задание 5 Продолжение задания 3 Спросить у пользователя, какой язык
    //у него любимый, если это Kotlin или Prolog, ответь пользователю, что он
    //— подлиза, для других языков придумать комментарий, воспользоваться
    //для решения задачи условным оператором и операторм when.

    println("Write ur favorite programm language: ")
    var language = readLine();

    if (language == "Kotlin" || language == "Prolog") println("Hahaha, r u podliza?")
    else println("Nice language, bro")

    when (language)
    {
        "Prolog" -> println("Hahaha, r u podliza?")
        "Kotlin" -> println("Hahaha, r u podliza?")
        else -> println("Nice language, bro")
    }


    //Задание 6 Новая программа «Работа с числами». Найти сумму цифр
    //числа. Рассмотреть класс целое число, Разобрать и включить в отчет
    //половину методов с использованием официальной документации языка.

    val input = Scanner(System.`in`)
    var num = input.nextInt()
    var summ= 0
    while(num != 0)
    {
        summ +=num % 10
        num = num / 10
    }
    println(summ)

    println("Метод and: ${num.and(10)}") // конъюнкция
    println("Метод compareTo: ${num.compareTo(11)}")
    println("Метод dec: ${num.dec()}")
    println("Метод div: ${num.div(2.5)}")
    println("Метод minus:${num.minus(3)}")
    println("Метод rangeTo: ${num.rangeTo(20)}")
    println("Метод xor:${num.xor(4)}")


    //Задание 7 «Работа с числами». Вынести нахождение суммы цифр числа в
    //отдельный
    //метод.
    //Реализовать
    //методы
    //поиска
    //максимальной
    //минимальной цифры числа, произведения цифр числа. Не удалять файл, в
    //следующих лабораторных будет внесена модификация.
    val input = Scanner(System.`in`)
    var num = input.nextInt()


    fun sumDigit(a: Int): Int
    {
    var sum = 0
    var num = a
    while (num != 0) {
        sum += (num % 10)
        num /= 10
    }

    return sum
    }
    println(sumDigit(num))


    fun maxDigit(a: Int): Int
    {
        var max = 0
        var num = a
        var buff:Int
        while (num != 0)
        {
            buff = num % 10
            if (buff > max) max = buff
            num /= 10
        }

        return max
    }
    println(maxDigit(num))

    fun minDigit(a: Int): Int
    {
        var num = a
        var min = num % 10
        var buff:Int
        while (num != 0)
        {
            buff = num % 10
            if (buff < min) {min = buff}
            num /= 10
        }

        return min
    }
    println(minDigit(num))

    fun expDigit(a: Int): Int
    {
        var exp = 1
        var num = a
        while (num != 0) {
            exp *= (num % 10)
            num /= 10
        }

        return exp
    }
    println(expDigit(num))
*/
    //Задание 8 «Работа с числами». Составить 3 метода для работы с цифрами
    //или делителей числа на основании варианта. Каждый метод отдельный
    //коммит.
    //Вариант № 3
    //Метод 1 Найти максимальный простой делитель числа.
    //Метод 2 Найти произведение цифр числа, не делящихся на 5
    //Метод 3 Найти НОД максимального нечетного непростого делителя
    //числа и прозведения цифр данного числа.
    /*val input = Scanner(System.`in`)
    var num = input.nextInt()*/

   /* fun simple(a: Int): Boolean
    {
        var num = a
        var flag: Boolean = true
        var buff:Int = 2
        while (num != buff)
        {
            if (num % buff == 0) {flag = false; return flag}
            buff++

        }

        return flag
    }

    fun maxDel(a: Int): Int
    {
        var exp = 2
        var num = a
        var maxD:Int = 0
        while (exp != num) {
            if (num % exp == 0 && simple(exp) && exp > maxD) maxD = exp
            exp++
            num--
        }

        return exp
    }

    println(maxDel(num) - 1)*/

   /* fun expDigitNon5(a: Int): Int
    {
        var exp = 1
        var num = a
        var buff:Int
        while (num != 0) {
            buff = num % 10
            if (buff % 5 != 0) exp *= (num % 10)

            num /= 10
        }

        return exp
    }
    println(expDigitNon5(num))*/

   /* fun simpleNot(a: Int): Boolean
    {
        var num = a
        var flag: Boolean = false
        var buff:Int = 2
        while (num != buff)
        {
            if (num % buff == 0) {flag = true; return flag}
            buff++

        }

        return flag
    }
    fun maxDelNon(a: Int): Int
    {
        var exp = 2
        var num = a
        var maxD:Int = 0
        while (exp != num) {
            if (num % exp == 0 && simpleNot(exp) && exp > maxD && num % 2 != 0) maxD = exp
            exp++
            num--
        }

        return (exp - 1)
    }

    fun nodExp(a: Int): Int
    {
        var exp = 2
        var num = a
        var nod = 0
        while(exp != num)
        {
            if (num % exp == 0 && exp > nod) nod = exp
            exp++
        }
        return nod
    }

    fun expDigit(a: Int): Int
    {
        var exp = 1
        var num = a
        while (num != 0) {
            exp *= (num % 10)
            num /= 10
        }

        return exp
    }
    println(expDigit(nodExp(maxDelNon(num))))

    //Задание 9 «Работа с числами». Реализовать возможность пользователю
    //выбирать, какие из методов для введенного числа он хочет исполнить, и
    //продолжать работу программы, пока пользователь не укажет обратное, то
    //есть пользователь может вводить числа и методы для них, пока не введет
    //соответствующую команду.

    println("Put ur number")
    val input = Scanner(System.`in`)
    var num = input.nextInt()
    var point = 0

    while(point != 5) {

        println("Which method u want chose?")
        println("1. Summ of digits")
        println("2. Max of digits")
        println("3. Min of digits")
        println("4. Exp of digits")
        println("5. End")
        val ch = Scanner(System.`in`)
        var point = ch.nextInt()

        when(point)
        {
            1 -> println(sumDigit(num))
            2 -> println(maxDigit(num))
            3 -> println(minDigit(num))
            4 -> println(expDigit(num))
            5 -> break
            else -> println("Sorry, no such answer")
        }
        
    }*/




    ReadFromFile();




}


fun ReadFromFile(){
    try{
        var fin = FileReader("src/main/kotlin/5000num")
        var c:Int?
        do{
            c = fin.read()
            print(c.toChar())
        }while(c!=-1)
    }catch (ex: Exception){print(ex.message)}
}


fun sumDigit(a: Int): Int
{
    var sum = 0
    var num = a
    while (num != 0) {
        sum += (num % 10)
        num /= 10
    }

    return sum
}



fun maxDigit(a: Int): Int
{
    var max = 0
    var num = a
    var buff:Int
    while (num != 0)
    {
        buff = num % 10
        if (buff > max) max = buff
        num /= 10
    }

    return max
}


fun minDigit(a: Int): Int
{
    var num = a
    var min = num % 10
    var buff:Int
    while (num != 0)
    {
        buff = num % 10
        if (buff < min) {min = buff}
        num /= 10
    }

    return min
}


fun expDigit(a: Int): Int
{
    var exp = 1
    var num = a
    while (num != 0) {
        exp *= (num % 10)
        num /= 10
    }

    return exp
}

