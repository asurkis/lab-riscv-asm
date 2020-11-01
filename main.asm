    # Начало программы
    li s0 3 # размер строки
    li s1 6 # размер столбца

    # цикл изначального заполнения массива
    addi t1 s1 -1
main_loop_t1: # внешний цикл по столбцам с конца
    addi t0 s0 -1
main_loop_t0: # внутренний цикл по строкам с конца
    # a[i][j] = 256 * i + j
    slli t2 t1 8
    add t2 t2 t0
    # добавление элемента массива в стек
    # массив пишется построчно с конца
    addi sp sp -4
    sw t2 0(sp)

    # конец цикла по t0
    addi t0 t0 -1
    bge t0 x0 main_loop_t0

    # конец цикла по t1
    addi t1 t1 -1
    bge t1 x0 main_loop_t1

    addi sp sp -12
    li t0 0x0502
    sw t0 0(sp) # число, которое ищем
    sw s0 4(sp) # размер строки
    sw s1 8(sp) # размер столбца
    call find_index2
    nop # для остановки в отладчике и проверки, что мы нашли индекс

    # то же самое, но без инструкций умножения/деления
    li t0 0x0502
    sw t0 0(sp)
    sw s0 4(sp)
    sw s1 8(sp)
    call find_index2_nodiv
    nop # для остановки в отладчике и проверки, что мы нашли индекс
    addi sp sp 84 # (3 + 3 * 6) * 4 -- размер данных, которые мы поместили на стек, всего

find_index:
    # Искомый элемент
    lw t3 0(sp)
    # Длина массива
    lw t4 4(sp)
    # Указатель на первый элемент массива (расположенный в стеке)
    addi t2 sp 8
    li t0 0
find_index_loop_t0: # цикл по массиву
    lw t1 0(t2) # выбор элемента
    beq t3 t1 find_index_return # нашли -- возвращаем
    addi t2 t2 4 # переход к следующему элементу
    addi t0 t0 1
    ble t0 t4 find_index_loop_t0
find_index_return: # возврат из функции
    mv a0 t0
    ret

find_index2:
    lw t0 0(sp) # искомый элемент
    lw t1 4(sp) # размер строки
    lw t2 8(sp) # размер столбца
    # сохраним размер строки и адрес возврата в стек
    sw t1 0(sp)
    sw ra -4(sp)
    # аргументы поиска индекса --
    # искомый элемент и размер массива
    addi sp sp 4
    sw t0 0(sp)
    mul t1 t1 t2
    sw t1 4(sp)
    # найдем индекс в одномерном массиве
    call find_index
    # восстанавливаем адрес возврата и размер строки
    addi sp sp -4
    lw ra -4(sp)
    lw t0 0(sp)
    # в a0 -- одномерный индекс
    # его нужно преобразовать к двумерному
    remu a1 a0 t0 # номер столбца
    divu a0 a0 t0 # номер строки
    ret

find_index2_nodiv:
    # поиск без деления через смещение указателя
    lw t3 0(sp) # искомый элемент
    lw t4 4(sp) # размер строки
    lw t5 8(sp) # размер столбца
    addi t6 sp 12 # итератор по массиву
    li t1 0
find_index2_nodiv_loop_t1: # внешний цикл по столбцам с начала
    li t0 0
find_index2_nodiv_loop_t0: # внутренний цикл по строкам с начала
    lw t2 0(t6) # выбор элемента
    beq t2 t3 find_index2_nodiv_return # нашли -- возвращаем
    addi t6 t6 4 # переход к следующему элементу

    # конец цикла по t0
    addi t0 t0 1
    bne t0 t4 find_index2_nodiv_loop_t0

    # конец цикла по t1
    addi t1 t1 1
    bne t1 t5 find_index2_nodiv_loop_t1
find_index2_nodiv_return:
    mv a1 t0 # номер столбца
    mv a0 t1 # номер строки
    ret
