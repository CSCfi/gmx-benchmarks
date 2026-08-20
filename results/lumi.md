# Strong scalability on LUMI GPUs

* [GROMACS 2026.1](#gromacs-20261)
* [GROMACS 2026.0](#gromacs-20260)
* [GROMACS 2025.4](#gromacs-20254)
* [GROMACS 2024.3](#gromacs-20243)
* [GROMACS 2023.1](#gromacs-20231)
* [GROMACS CPU 2026.1](#gromacs-cpu-20261)

## GROMACS 2026.1

* STMV benchmark (1067k atoms)
* ROCm 6.3.4
* SYCL backend (AdaptiveCpp 24.02.0)
* Run on 2026-05-15

| MPI ranks | Threads/rank | GCDs | Performance (ns/day) |
|-----------|--------------|------|----------------------|
| 1         | 7            | 1    | 18.772               |
| 3         | 7            | 2    | 35.873               |
| 8         | 4            | 4    | 69.248               |
| 8         | 7            | 8    | 110.633              |


## GROMACS 2026.0

* STMV benchmark (1067k atoms)
* ROCm 6.3.4
* SYCL backend (AdaptiveCpp 24.02.0)
* Run on 2026-02-16

| MPI ranks | Threads/rank | GCDs | Performance (ns/day) |
|-----------|--------------|------|----------------------|
| 1         | 7            | 1    | 18.975               |
| 3         | 7            | 2    | 35.561               |
| 8         | 4            | 4    | 68.044               |
| 8         | 7            | 8    | 110.665              |

## GROMACS 2025.4

* STMV benchmark (1067k atoms)
* ROCm 6.0.3
* SYCL backend (AdaptiveCpp 23.10.0)
* Run on 2025-12-08

| MPI ranks | Threads/rank | GCDs | Performance (ns/day) |
|-----------|--------------|------|----------------------|
| 1         | 7            | 1    | 18.844               |
| 3         | 7            | 2    | 35.098               |
| 8         | 4            | 4    | 68.820               |
| 8         | 7            | 8    | 107.761              |

## GROMACS 2024.3

* STMV benchmark (1067k atoms)
* ROCm 6.0.3
* SYCL backend (AdaptiveCpp 23.10.0)
* Run on 2024-09-25

| MPI ranks | Threads/rank | GCDs | Performance (ns/day) |
|-----------|--------------|------|----------------------|
| 1         | 7            | 1    | 17.940               |
| 3         | 7            | 2    | 32.266               |
| 8         | 4            | 4    | 61.754               |
| 8         | 7            | 8    | 105.611              |

## GROMACS 2023.1

* STMV benchmark (1067k atoms)
* ROCm 5.3.3
* SYCL backend (hipSYCL 0.9.4)
* Run on 2023-06-21

| MPI ranks | Threads/rank | GCDs | Performance (ns/day) |
|-----------|--------------|------|----------------------|
| 1         | 7            | 1    | 16.468               |
| 4         | 3            | 2    | 26.479               |
| 8         | 3            | 4    | 53.306               |
| 8         | 7            | 8    | 78.856               |

## GROMACS CPU 2026.1

* STMV benchmark (1067k atoms)
* gcc-native/14.2
* PrgEnv-gnu/8.6.0
* fftw-3.3.10-sse2-avx-avx2-avx2_128
* Run on 2026-08-17

| MPI ranks | Threads/rank | GCDs | Performance (ns/day) |
|-----------|--------------|------|----------------------|
| 128         | 1            | 0    | 10.511               |
| 256         | 1            | 0    | 20.780               |
| 512         | 1            | 0    | 39.849               |
| 512         | 2            | 0    | 72.939               |
| 256         | 4            | 0    | 73.721               |

