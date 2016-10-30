
#define CONFIG_IRQ_COUNT 32
#define STACK_SIZE	0x400

.section .isr_vectors
.align 2
.globl _init_vectors
_init_vectors:
.long 0x20001ffc
.long reset_handler
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception

/* IRQ 0 */
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
/* IRQ 8 */
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
/* IRQ 16 */
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
/* IRQ 24 */
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception
.long _unhandled_exception


.text
.align 2

.globl main_start
.globl _unhandled_exception
.globl reset_handler

.org 0x100
.thumb
.thumb_func
reset_handler:
/* Clear RST RMU */
mov r0, #0x0
ldr r1,  =0x400CA000 
str r0, [r1, #0x0]

/* Clear RST EMU */
mov r0, #0x1
ldr r1, =0x400C6000
str r0, [r1, #0x0]
mov r0, #0x0
str r0, [r1, #0x0]


b main_start

