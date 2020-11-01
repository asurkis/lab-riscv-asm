_Z10find_indexiPij:                     # @_Z10find_indexiPij
        # Адрес возврата сохраняется в стек
        # Указатель стека сохраняется в стек и s0
        addi    sp, sp, -32
        sw      ra, 28(sp)
        sw      s0, 24(sp)
        addi    s0, sp, 32
        # Аргументы сохраняются в стек
        sw      a0, -16(s0)
        sw      a1, -20(s0)
        sw      a2, -24(s0)
        mv      a0, zero
        sw      a0, -28(s0)
        j       .LBB0_1
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
        # Сравнение элемента и возврат, если найден
        lw      a0, -28(s0)
        lw      a1, -24(s0)
        bgeu    a0, a1, .LBB0_6
        # Это можно убрать
        j       .LBB0_2
.LBB0_2:                                #   in Loop: Header=BB0_1 Depth=1
        #
        lw      a0, -20(s0)
        lw      a1, -28(s0)
        slli    a1, a1, 2
        add     a0, a0, a1
        lw      a0, 0(a0)
        lw      a1, -16(s0)
        bne     a0, a1, .LBB0_4
        j       .LBB0_3
.LBB0_3:
        lw      a0, -28(s0)
        sw      a0, -12(s0)
        j       .LBB0_7
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
        j       .LBB0_5
.LBB0_5:                                #   in Loop: Header=BB0_1 Depth=1
        lw      a0, -28(s0)
        addi    a0, a0, 1
        sw      a0, -28(s0)
        j       .LBB0_1
.LBB0_6:
        lw      a0, -24(s0)
        sw      a0, -12(s0)
        j       .LBB0_7
.LBB0_7:
        lw      a0, -12(s0)
        lw      s0, 24(sp)
        lw      ra, 28(sp)
        addi    sp, sp, 32
        ret
_Z11find_index2iPijj:                   # @_Z11find_index2iPijj
        addi    sp, sp, -48
        sw      ra, 44(sp)
        sw      s0, 40(sp)
        addi    s0, sp, 48
        sw      a0, -20(s0)
        sw      a1, -24(s0)
        sw      a2, -28(s0)
        sw      a3, -32(s0)
        lw      a0, -20(s0)
        lw      a1, -24(s0)
        lw      a2, -28(s0)
        lw      a3, -32(s0)
        mul     a2, a2, a3
        call    _Z10find_indexiPij
        sw      a0, -36(s0)
        lw      a0, -36(s0)
        lw      a1, -28(s0)
        divu    a0, a0, a1
        sw      a0, -16(s0)
        lw      a0, -36(s0)
        lw      a1, -28(s0)
        remu    a0, a0, a1
        sw      a0, -12(s0)
        lw      a0, -16(s0)
        lw      a1, -12(s0)
        lw      s0, 40(sp)
        lw      ra, 44(sp)
        addi    sp, sp, 48
        ret
_Z17find_index2_nodiviPijj:             # @_Z17find_index2_nodiviPijj
        addi    sp, sp, -32
        sw      ra, 28(sp)
        sw      s0, 24(sp)
        addi    s0, sp, 32
        sw      a0, -20(s0)
        sw      a1, -24(s0)
        sw      a2, -28(s0)
        sw      a3, -32(s0)
        mv      a0, zero
        sw      a0, -16(s0)
        j       .LBB2_1
.LBB2_1:                                # =>This Loop Header: Depth=1
        lw      a0, -16(s0)
        lw      a1, -32(s0)
        bgeu    a0, a1, .LBB2_10
        j       .LBB2_2
.LBB2_2:                                #   in Loop: Header=BB2_1 Depth=1
        mv      a0, zero
        sw      a0, -12(s0)
        j       .LBB2_3
.LBB2_3:                                #   Parent Loop BB2_1 Depth=1
        lw      a0, -12(s0)
        lw      a1, -28(s0)
        bgeu    a0, a1, .LBB2_8
        j       .LBB2_4
.LBB2_4:                                #   in Loop: Header=BB2_3 Depth=2
        lw      a0, -24(s0)
        addi    a1, a0, 4
        sw      a1, -24(s0)
        lw      a0, 0(a0)
        lw      a1, -20(s0)
        bne     a0, a1, .LBB2_6
        j       .LBB2_5
.LBB2_5:
        j       .LBB2_11
.LBB2_6:                                #   in Loop: Header=BB2_3 Depth=2
        j       .LBB2_7
.LBB2_7:                                #   in Loop: Header=BB2_3 Depth=2
        lw      a0, -12(s0)
        addi    a0, a0, 1
        sw      a0, -12(s0)
        j       .LBB2_3
.LBB2_8:                                #   in Loop: Header=BB2_1 Depth=1
        j       .LBB2_9
.LBB2_9:                                #   in Loop: Header=BB2_1 Depth=1
        lw      a0, -16(s0)
        addi    a0, a0, 1
        sw      a0, -16(s0)
        j       .LBB2_1
.LBB2_10:
        j       .LBB2_11
.LBB2_11:
        lw      a0, -16(s0)
        lw      a1, -12(s0)
        lw      s0, 24(sp)
        lw      ra, 28(sp)
        addi    sp, sp, 32
        ret
main:                                   # @main
        addi    sp, sp, -128
        sw      ra, 124(sp)
        sw      s0, 120(sp)
        addi    s0, sp, 128
        mv      a0, zero
        sw      a0, -12(s0)
        sw      a0, -88(s0)
        j       .LBB3_1
.LBB3_1:                                # =>This Loop Header: Depth=1
        lw      a1, -88(s0)
        addi    a0, zero, 5
        bltu    a0, a1, .LBB3_8
        j       .LBB3_2
.LBB3_2:                                #   in Loop: Header=BB3_1 Depth=1
        mv      a0, zero
        sw      a0, -92(s0)
        j       .LBB3_3
.LBB3_3:                                #   Parent Loop BB3_1 Depth=1
        lw      a1, -92(s0)
        addi    a0, zero, 2
        bltu    a0, a1, .LBB3_6
        j       .LBB3_4
.LBB3_4:                                #   in Loop: Header=BB3_3 Depth=2
        lw      a1, -88(s0)
        slli    a0, a1, 8
        lw      a2, -92(s0)
        add     a0, a0, a2
        addi    a3, zero, 3
        mul     a1, a1, a3
        add     a1, a1, a2
        slli    a2, a1, 2
        addi    a1, s0, -84
        add     a1, a1, a2
        sw      a0, 0(a1)
        j       .LBB3_5
.LBB3_5:                                #   in Loop: Header=BB3_3 Depth=2
        lw      a0, -92(s0)
        addi    a0, a0, 1
        sw      a0, -92(s0)
        j       .LBB3_3
.LBB3_6:                                #   in Loop: Header=BB3_1 Depth=1
        j       .LBB3_7
.LBB3_7:                                #   in Loop: Header=BB3_1 Depth=1
        lw      a0, -88(s0)
        addi    a0, a0, 1
        sw      a0, -88(s0)
        j       .LBB3_1
.LBB3_8:
        addi    a0, zero, 1282
        sw      a0, -120(s0)
        addi    a1, s0, -84
        sw      a1, -116(s0)
        addi    a2, zero, 18
        call    _Z10find_indexiPij
        lw      a1, -116(s0)
        add     a2, zero, a0
        lw      a0, -120(s0)
        sw      a2, -96(s0)
        addi    a2, zero, 3
        sw      a2, -128(s0)
        addi    a3, zero, 6
        sw      a3, -124(s0)
        call    _Z11find_index2iPijj
        lw      a2, -128(s0)
        lw      a3, -124(s0)
        add     a4, zero, a0
        lw      a0, -120(s0)
        add     a5, zero, a1
        lw      a1, -116(s0)
        sw      a5, -100(s0)
        sw      a4, -104(s0)
        call    _Z17find_index2_nodiviPijj
        sw      a1, -108(s0)
        sw      a0, -112(s0)
        mv      a0, zero
        lw      s0, 120(sp)
        lw      ra, 124(sp)
        addi    sp, sp, 128
        ret
