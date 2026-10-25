# Ho va ten: Mai Duc Tu - MSSV: 25521996 - Muc dich: Nhap xuat va tinh dien nang tieu thu 3 thang theo MSSV (Thi nghiem 3)
# KE HOACH DUNG THANH GHI:
# reading0   $s0   chi so dau thang 1 (nhap tu ban phim)
# reading1   $s1   chi so dau thang 2 (nhap tu ban phim)
# reading2   $s2   chi so dau thang 3 (nhap tu ban phim)
# reading3   $s3   chi so cuoi thang 3 (nhap tu ban phim)
# usage1     $t0   dien nang thang 1 (reading1 - reading0)
# usage2     $t1   dien nang thang 2 (reading2 - reading1)
# usage3     $t2   dien nang thang 3 (reading3 - reading2)
# total      $t3   tong dien nang 3 thang (usage1 + usage2 + usage3)
# $v0, $a0   chua ma dich vu va doi so cho syscall

.data
prompt: .asciiz "Nhap chi so (kWh): "
m1:     .asciiz "Thang 1: "
m2:     .asciiz "Thang 2: "
m3:     .asciiz "Thang 3: "
tot:    .asciiz "Tong:    "
nl:     .asciiz "\n"

.text
.globl main
main:
    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s0, $v0, $zero

    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s1, $v0, $zero

    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s2, $v0, $zero

    li   $v0, 4
    la   $a0, prompt
    syscall
    li   $v0, 5
    syscall
    add  $s3, $v0, $zero

    sub  $t0, $s1, $s0
    sub  $t1, $s2, $s1
    sub  $t2, $s3, $s2
    add  $t3, $t0, $t1
    add  $t3, $t3, $t2

    li   $v0, 4
    la   $a0, m1
    syscall
    li   $v0, 1
    add  $a0, $t0, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 4
    la   $a0, m2
    syscall
    li   $v0, 1
    add  $a0, $t1, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 4
    la   $a0, m3
    syscall
    li   $v0, 1
    add  $a0, $t2, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 4
    la   $a0, tot
    syscall
    li   $v0, 1
    add  $a0, $t3, $zero
    syscall
    li   $v0, 4
    la   $a0, nl
    syscall

    li   $v0, 10
    syscall