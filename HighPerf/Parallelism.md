Parallelism
==============
- Julia has a built-in support for a distributed memory parallelism
- one-sided message passing routines
 - `remotecall` to launch a computation on a given process
 - `fetch` to retrieve informations
- high level routines
 - @parallel reduction for lightweight iterations
 - pmap for heavy iterations
- support for distributed arrays in the standard library
