module DH32ParallelUtils

# package code goes here
export split_int

"""
Splits an integer number N into a set of n_procs contiguous, non-overlapping integer intervals [ix_start[i], ix_end[i]].

Input:

- N: number to be split.

- n_procs: number of processes.

- delta (default: 1.0e-20): number added for application of floor and ceil.

Output: ix_start, ix_end

- ix_start: int array of start indexes.

- ix_end: int array of end indexes.
"""
function split_int(N::Int64, n_procs::Int64, delta::Float64=1.0e-20)
    ix_start = zeros(Int64,n_procs)
    ix_end = zeros(Int64,n_procs)
    float_bounds = linspace(delta, Float64(N)+delta, n_procs+1)
    for i in 1:n_procs
        ix_start[i] = ceil(Int64,float_bounds[i])
        ix_end[i] = floor(Int64,float_bounds[i+1])
    end
    ix_start, ix_end
end

end # module
