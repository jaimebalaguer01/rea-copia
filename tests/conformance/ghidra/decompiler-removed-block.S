// rea_removed_block branches on a register it has just set to zero, so
// Ghidra's decompiler folds the branch and removes the block at entry+0x10
// ("Removing unreachable block"). The listing still disassembles that block.
// rea_reachable_block branches on its argument and keeps both paths.
#if defined(__APPLE__)
.section __TEXT,__text,regular,pure_instructions
.globl _rea_removed_block
.globl _rea_reachable_block
.p2align 2
_rea_removed_block:
#else
.text
.globl rea_removed_block
.globl rea_reachable_block
.type rea_removed_block,%function
.type rea_reachable_block,%function
.p2align 2
rea_removed_block:
#endif
  mov w9, #0
  cbnz w9, 1f
  mov w0, #1
  ret
1:
  mov w0, #0x77
  ret
#if defined(__APPLE__)
_rea_reachable_block:
#else
rea_reachable_block:
#endif
  cbnz w0, 2f
  mov w0, #1
  ret
2:
  mov w0, #0x77
  ret
