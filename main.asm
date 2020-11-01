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

    # число, которое ищем
    li a0 0x0502
    # сам массив расположен на стеке
    # но указатель стека смещается при вызове функции
    mv a1 sp
    # размеры массива
    mv a2 s0
    mv a3 s1
    call find_index2
    nop # для остановки в отладчике и проверки, что мы нашли индекс

    # то же самое, но без инструкций умножения/деления
    li a0 0x0502
    mv a1 sp
    mv a2 s0
    mv a3 s1
    call find_index2_nodiv
    nop # для остановки в отладчике и проверки, что мы нашли индекс

find_index:
    # в a1 -- адрес начала массива
    li t0 0
find_index_loop_t0:
    lw t1 0(a1) # выбор элемента
    beq a0 t1 find_index_return # нашли -- возвращаем
    addi a1 a1 4 # переход к следующему элементу
    addi t0 t0 1
    ble t0 a2 find_index_loop_t0
find_index_return: # возврат результата
    mv a0 t0
    ret

find_index2:
    # сохраним размер строки и адрес возврата в стек
    addi sp sp -8
    sw a2 0(sp)
    sw ra 4(sp)
    # найдем индекс в одномерном массиве
    mul a2 a2 a3
    call find_index
    # восстанавливаем адрес возврата и размер строки
    lw a2 0(sp)
    lw ra 4(sp)
    addi sp sp 8
    # в a0 -- одномерный индекс
    # его нужно преобразовать к двумерному
    divu a1 a0 a2
    remu a0 a0 a2
    ret

find_index2_nodiv:
    # поиск без деления через смещение указателя
    li t1 0
find_index2_nodiv_loop_t1: # внешний цикл по столбцам с начала
    li t0 0
find_index2_nodiv_loop_t0: # внутренний цикл по строкам с начала
    lw t2 0(a1) # выбор элемента
    beq t2 a0 find_index2_nodiv_return # нашли -- возвращаем
    addi a1 a1 4 # переход к следующему элементу

    # конец цикла по t0
    addi t0 t0 1
    bne t0 a2 find_index2_nodiv_loop_t0

    # конец цикла по t1
    addi t1 t1 1
    bne t1 a3 find_index2_nodiv_loop_t1
find_index2_nodiv_return:
    mv a0 t1
    mv a1 t0
    ret
