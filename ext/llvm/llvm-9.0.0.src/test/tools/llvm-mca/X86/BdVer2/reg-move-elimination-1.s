# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=bdver2 -iterations=3 -timeline -register-file-stats < %s | FileCheck %s

# The register move from XMM0 to XMM1 can be eliminated at register renaming
# stage. So, it should not consume pipeline resources.

vxorps %xmm0, %xmm0, %xmm0
vmovaps %xmm0, %xmm1
vaddps %xmm1, %xmm1, %xmm2

# CHECK:      Iterations:        3
# CHECK-NEXT: Instructions:      9
# CHECK-NEXT: Total Cycles:      13
# CHECK-NEXT: Total uOps:        9

# CHECK:      Dispatch Width:    4
# CHECK-NEXT: uOps Per Cycle:    0.69
# CHECK-NEXT: IPC:               0.69
# CHECK-NEXT: Block RThroughput: 1.5

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  1      0     0.25                        vxorps	%xmm0, %xmm0, %xmm0
# CHECK-NEXT:  1      1     1.00                        vmovaps	%xmm0, %xmm1
# CHECK-NEXT:  1      5     1.00                        vaddps	%xmm1, %xmm1, %xmm2

# CHECK:      Register File statistics:
# CHECK-NEXT: Total number of mappings created:    6
# CHECK-NEXT: Max number of mappings used:         6

# CHECK:      *  Register File #1 -- PdFpuPRF:
# CHECK-NEXT:    Number of physical registers:     160
# CHECK-NEXT:    Total number of mappings created: 6
# CHECK-NEXT:    Max number of mappings used:      6

# CHECK:      *  Register File #2 -- PdIntegerPRF:
# CHECK-NEXT:    Number of physical registers:     96
# CHECK-NEXT:    Total number of mappings created: 0
# CHECK-NEXT:    Max number of mappings used:      0

# CHECK:      Resources:
# CHECK-NEXT: [0.0] - PdAGLU01
# CHECK-NEXT: [0.1] - PdAGLU01
# CHECK-NEXT: [1]   - PdBranch
# CHECK-NEXT: [2]   - PdCount
# CHECK-NEXT: [3]   - PdDiv
# CHECK-NEXT: [4]   - PdEX0
# CHECK-NEXT: [5]   - PdEX1
# CHECK-NEXT: [6]   - PdFPCVT
# CHECK-NEXT: [7.0] - PdFPFMA
# CHECK-NEXT: [7.1] - PdFPFMA
# CHECK-NEXT: [8.0] - PdFPMAL
# CHECK-NEXT: [8.1] - PdFPMAL
# CHECK-NEXT: [9]   - PdFPMMA
# CHECK-NEXT: [10]  - PdFPSTO
# CHECK-NEXT: [11]  - PdFPU0
# CHECK-NEXT: [12]  - PdFPU1
# CHECK-NEXT: [13]  - PdFPU2
# CHECK-NEXT: [14]  - PdFPU3
# CHECK-NEXT: [15]  - PdFPXBR
# CHECK-NEXT: [16.0] - PdLoad
# CHECK-NEXT: [16.1] - PdLoad
# CHECK-NEXT: [17]  - PdMul
# CHECK-NEXT: [18]  - PdStore

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0.0]  [0.1]  [1]    [2]    [3]    [4]    [5]    [6]    [7.0]  [7.1]  [8.0]  [8.1]  [9]    [10]   [11]   [12]   [13]   [14]   [15]   [16.0] [16.1] [17]   [18]
# CHECK-NEXT:  -      -      -      -      -      -      -      -     1.33   1.67    -      -      -      -     1.33   0.67    -      -      -      -      -      -      -

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0.0]  [0.1]  [1]    [2]    [3]    [4]    [5]    [6]    [7.0]  [7.1]  [8.0]  [8.1]  [9]    [10]   [11]   [12]   [13]   [14]   [15]   [16.0] [16.1] [17]   [18]   Instructions:
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -      -     vxorps	%xmm0, %xmm0, %xmm0
# CHECK-NEXT:  -      -      -      -      -      -      -      -     0.67   1.33    -      -      -      -     0.33   0.67    -      -      -      -      -      -      -     vmovaps	%xmm0, %xmm1
# CHECK-NEXT:  -      -      -      -      -      -      -      -     0.67   0.33    -      -      -      -     1.00    -      -      -      -      -      -      -      -     vaddps	%xmm1, %xmm1, %xmm2

# CHECK:      Timeline view:
# CHECK-NEXT:                     012
# CHECK-NEXT: Index     0123456789

# CHECK:      [0,0]     DR   .    . .   vxorps	%xmm0, %xmm0, %xmm0
# CHECK-NEXT: [0,1]     DeER .    . .   vmovaps	%xmm0, %xmm1
# CHECK-NEXT: [0,2]     D=eeeeeER . .   vaddps	%xmm1, %xmm1, %xmm2
# CHECK-NEXT: [1,0]     D-------R . .   vxorps	%xmm0, %xmm0, %xmm0
# CHECK-NEXT: [1,1]     .D=eE---R . .   vmovaps	%xmm0, %xmm1
# CHECK-NEXT: [1,2]     .D===eeeeeER.   vaddps	%xmm1, %xmm1, %xmm2
# CHECK-NEXT: [2,0]     .D---------R.   vxorps	%xmm0, %xmm0, %xmm0
# CHECK-NEXT: [2,1]     .D=eE------R.   vmovaps	%xmm0, %xmm1
# CHECK-NEXT: [2,2]     . D===eeeeeER   vaddps	%xmm1, %xmm1, %xmm2

# CHECK:      Average Wait times (based on the timeline view):
# CHECK-NEXT: [0]: Executions
# CHECK-NEXT: [1]: Average time spent waiting in a scheduler's queue
# CHECK-NEXT: [2]: Average time spent waiting in a scheduler's queue while ready
# CHECK-NEXT: [3]: Average time elapsed from WB until retire stage

# CHECK:            [0]    [1]    [2]    [3]
# CHECK-NEXT: 0.     3     0.0    0.0    5.3       vxorps	%xmm0, %xmm0, %xmm0
# CHECK-NEXT: 1.     3     1.7    1.7    3.0       vmovaps	%xmm0, %xmm1
# CHECK-NEXT: 2.     3     3.3    1.0    0.0       vaddps	%xmm1, %xmm1, %xmm2