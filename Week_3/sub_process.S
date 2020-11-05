# Computer Architecture, MIPS

leaf_example:
  
  # Var olan Registerların önceki değerlerini korumak için Stack'e yaz.
  ADDI $sp, $sp, -12    # Stack içerisinde 3* 32bit(4 Byte) yer aç. 3 * 4 Byte = 12 Byte
  SW $t1, 8($sp)        # Push $t1
  SW $t0, 4($sp)        # Push $t0
  SW $s0, 0($sp)        # Push $s0
  
  # İşlemleri gerçekleştir.
  ADD $t1, $a0, $a1     # t1 = (g + h)
  ADD $t0, $a2, $a3     # t0 = (i + j)
  SUB $s0, $t1, $t0     # f = s0 = (g + h) - (i + j)
  
  # Elde edilen sonucu dönder.
  ADD $v0, $s0, $zero   # v0 = s0 + 0 => $v0 = $s0
  
  # Registerların değerlerini eski haline geri getir.
  LW $s0, 0($sp)        # Pop $s0
  LW $t0, 4($sp)        # Pop $t0
  LW $t1, 8($sp)        # Pop $t1
  ADDI $sp, $sp, 12     # Stacki eski haline getir
  
  # Çağırılan yere geri dön.
  jr $ra
