using DH32ParallelUtils
using Base.Test

# write your own tests here
ix_start, ix_end = split_int(2000, 3)
@test ix_start == [1,667,1334]
@test ix_end == [666,1333,2000]
