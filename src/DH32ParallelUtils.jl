module DH32ParallelUtils

# package code goes here
export split_int

"""
Splits an integer number N into a set of n_procs contiguous, non-overlapping integer intervals [ix_start[i], ix_end[i]].

Input:

- N: number to be split.

- n_procs: number of processes.

Output: ix_start, ix_end

- ix_start: int array of start indexes.

- ix_end: int array of end indexes.
"""
function split_int(N::Int64, n_procs::Int64)
    ix_start = zeros(Int64,n_procs)
    ix_end = zeros(Int64,n_procs)
    float_bounds = linspace(1., Float64(N), n_procs+1)
    ix_start[1] = 1
    ix_end[n_procs] = N
    for i in 2:n_procs
        ix_start[i] = round(Int64,float_bounds[i])
        ix_end[i-1] = ix_start[i]-1
    end
    ix_start, ix_end
end

end # module
