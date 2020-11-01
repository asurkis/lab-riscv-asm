# Лабораторная работа № 1

1. Завести аккаунт на Github.com (если еще нет) и создать репозиторий с именем lab-riscv-asm.
2. Разработать алгоритм решения вашего варианта задачи.
3. Реализовать алгоритм на языке ассемблера RISCV и сохранить исходный код программы в репозитории.
    - Код должен быть снабжен комментариями, поясняющими основные объявления и вычисления.
    - Убедиться в корректности выполнения работы и продемонстрировать результат можно используя симулятор Venus https://www.kvakil.me/venus/
4. На дополнительные баллы. Реализовать алгоритм на языке Си и сохранить исходный код программы в репозитории.
    - Скомпилировать С код используя riscv-компилятор и убедиться в собираемости исходного кода.
    - Получить дамп-файл из скомпилированного исполняемого файла вашей программы и сохранить дамп-файл в репозитории.
    - Найти в дамп файле тело вызываемой процедуры и main. Попробовать проанализировать во что компилируется С код.
5. Оформить отчет о проделанной работе и результатах в виде `README.md` файла вашего репозитория.
6. Ссылку на ваш github-репозиторий прикрепить в качестве результата этого задания. Дальнейшие обсуждения по вашим результатам будут вестись в комментариях к вашей работе в Canvas или Github.

Каждое задание представляет собой простую задачу на обработку двумерного массива. Непосредственную обработку массива необходимо реализовать в виде отдельной функции с необходимыми аргументами. Во всех заданиях используется двумерный массив размера N на M, где N - размер строки, а M - размер столбца.

При написании программы на языке ассемблера следует учесть то, что в явном виде подпрограммы/процедуры/функции в RISC-подобных ассемблерах отсутствуют. Вместо этого существует специальный набор соглашений (ABI), устанавливающий формат передачи аргументов, специальную роль для каждого регистра, формат вызовов и так далее. В работе предлагается реализовать передачу аргументов функции используя один из следующих методов:

- по значению - для передачи переменной используется её непосредственное значение
- по ссылке - для передачи переменной используется указатель
- через стек - значение переменное сохраняется в стеке, вызываемая функция извлекает это значение с вершины стека

Для реализации этих методов необходимо использовать соответствующие регистры, описанные в стандарте RISC-V ISA. Передавать параметры необходимо только процедуре, осуществляющей непосредственную обработку массива, остальное - по желанию.

## Вариант № 15
### Задача № 5

Найти индекс элемента с заданным значением.
Предполагается, что в массиве есть такой элемент и он единственный.
- N = 3 &mdash; размер строки;
- M = 6 &mdash; размер столбца.

Передача параметров через стек.

## Решение:

Код на ассемблере -- в файле `main.asm`.

На C -- в `main.c`.

Дамп исходного кода на C -- в `dump_c_godbolt.txt`.

Дизассемблирование дампа -- в `dump_c_godbolt.asm`.

Начало функции `main` -- по адресу `0x1CC` (`0xF8010113` -- инструкция `addi sp sp -128`).

Компилятор C сохраняет `s0` и адрес возврата в стек, а в `s0` записывает указатель стека
даже тогда, когда функция не вызывает ни одну другую функцию.
Это необязательно.
В остальном операторы C переводятся в машинные инструкции почти напрямую.

## Вывод:

В данной лабораторной работе я изучал ассемблер RISC-V.
Для этого я использовал
- Venus -- компилятор, эмулятор и отладчик RISC-V.
- Godbolt -- онлайн-компилятор и дизассемблер C и C++ для различных архитектур, в данном случае -- RISC-V.
Я рассмотрел работу базовых инструкций, реализацию функций и основные регистры.
Передача всех аргументов функции через стек неудобна и медлительна,
т.к. обращение к стеку медленнее, чем к регистрам, и требует большего количества инструкций,
но обладает большей гибкостью, т.к. можно передать неограниченное количество параметров,
в отличие от передачи только через регистры.
В реальных приложениях имеет смысл использовать смешанный вариант передачи аргументов и результатов выполнения функции.
