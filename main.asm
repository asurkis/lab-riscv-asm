    # Начало программы
    li s0 3 # размер строки
    li s1 6 # размер столбца

    # цикл изначального заполнения массива
    # внешний цикл по столбцам с конца
    addi t1 s1 -1
11:
    # внутренний цикл по строкам с конца
    addi t0 s0 -1
10:
    # a[i][j] = 256 * i + j
    slli t2 t1 8
    add t2 t2 t0
    # добавление элемента массива в стек
    # массив пишется построчно с конца
    addi sp sp -4
    sw t2 0(sp)

    # конец цикла по t0
    addi t0 t0 -1
    bge t0 x0 10

    # конец цикла по t1
    addi t1 t1 -1
    bge t1 x0 11

    # число, которое ищем
    li a0 0x0502
    # сам массив расположен на стеке
    # но указатель стека смещается при вызове функции
    mv a1 sp
    # размеры массива
    mv a2 s0
    mv a3 s1
    call find_index_2d


find_index_2d:
    call find_index
    ret

find_index:
    ret
