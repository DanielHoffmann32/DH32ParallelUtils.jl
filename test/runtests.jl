using DH32ParallelUtils
using Base.Test

# write your own tests here

### split_int ###
ix_start, ix_end = DH32ParallelUtils.split_int(2000, 3)
@test ix_start == [1,667,1334]
@test ix_end == [666,1333,2000]

ix_start, ix_end = DH32ParallelUtils.split_int(2000, 2)
@test ix_start == [1,1000]
@test ix_end == [999,2000]
