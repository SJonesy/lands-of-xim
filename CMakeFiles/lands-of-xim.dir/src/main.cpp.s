	.arch armv8-a
	.file	"main.cpp"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"My Window"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB5337:
	.cfi_startproc
	stp	x29, x30, [sp, -176]!
	.cfi_def_cfa_offset 176
	.cfi_offset 29, -176
	.cfi_offset 30, -168
	mov	x29, sp
	str	w0, [sp, 28]
	str	x1, [sp, 16]
	adrp	x0, :got:__stack_chk_guard
	ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x1, [x0]
	str	x1, [sp, 168]
	mov	x1, 0
	mov	w0, 32
	bl	SDL_Init
	mov	w5, 4097
	mov	w4, 0
	mov	w3, 0
	mov	w2, 536805376
	mov	w1, 536805376
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	SDL_CreateWindow
	str	x0, [sp, 56]
	add	x1, sp, 52
	add	x0, sp, 48
	mov	x2, x1
	mov	x1, x0
	ldr	x0, [sp, 56]
	bl	SDL_GetWindowSize
	stp	xzr, xzr, [sp, 80]
	ldr	w0, [sp, 48]
	lsl	w0, w0, 1
	mov	w1, 21846
	movk	w1, 0x5555, lsl 16
	smull	x1, w0, w1
	lsr	x1, x1, 32
	asr	w0, w0, 31
	sub	w0, w1, w0
	str	w0, [sp, 88]
	ldr	w0, [sp, 52]
	str	w0, [sp, 92]
	stp	xzr, xzr, [sp, 96]
	ldr	w0, [sp, 48]
	lsl	w0, w0, 1
	mov	w1, 21846
	movk	w1, 0x5555, lsl 16
	smull	x1, w0, w1
	lsr	x1, x1, 32
	asr	w0, w0, 31
	sub	w0, w1, w0
	str	w0, [sp, 96]
	ldr	w0, [sp, 48]
	mov	w1, 21846
	movk	w1, 0x5555, lsl 16
	smull	x1, w0, w1
	lsr	x1, x1, 32
	asr	w0, w0, 31
	sub	w0, w1, w0
	str	w0, [sp, 104]
	ldr	w0, [sp, 52]
	str	w0, [sp, 108]
	mov	w2, 2
	mov	w1, -1
	ldr	x0, [sp, 56]
	bl	SDL_CreateRenderer
	str	x0, [sp, 64]
	mov	w2, 2
	mov	w1, -1
	ldr	x0, [sp, 56]
	bl	SDL_CreateRenderer
	str	x0, [sp, 72]
	mov	w4, -1
	mov	w3, 0
	mov	w2, 0
	mov	w1, 0
	ldr	x0, [sp, 64]
	bl	SDL_SetRenderDrawColor
	ldr	x0, [sp, 64]
	bl	SDL_RenderClear
	mov	w4, -1
	mov	w3, -1
	mov	w2, -1
	mov	w1, -1
	ldr	x0, [sp, 72]
	bl	SDL_SetRenderDrawColor
	ldr	x0, [sp, 72]
	bl	SDL_RenderClear
	mov	w4, -1
	mov	w3, 0
	mov	w2, -1
	mov	w1, -1
	ldr	x0, [sp, 64]
	bl	SDL_SetRenderDrawColor
	add	x0, sp, 80
	mov	x1, x0
	ldr	x0, [sp, 64]
	bl	SDL_RenderFillRect
	mov	w4, -1
	mov	w3, -1
	mov	w2, 0
	mov	w1, 0
	ldr	x0, [sp, 72]
	bl	SDL_SetRenderDrawColor
	add	x0, sp, 96
	mov	x1, x0
	ldr	x0, [sp, 72]
	bl	SDL_RenderFillRect
	ldr	x0, [sp, 64]
	bl	SDL_RenderPresent
	ldr	x0, [sp, 72]
	bl	SDL_RenderPresent
	strb	wzr, [sp, 47]
	b	.L2
.L5:
	ldr	w0, [sp, 112]
	cmp	w0, 256
	beq	.L4
	ldr	w0, [sp, 112]
	cmp	w0, 768
	bne	.L3
	ldr	w0, [sp, 132]
	cmp	w0, 113
	bne	.L3
.L4:
	mov	w0, 1
	strb	w0, [sp, 47]
.L3:
	add	x0, sp, 112
	bl	SDL_PollEvent
	cmp	w0, 0
	cset	w0, ne
	and	w0, w0, 255
	cmp	w0, 0
	bne	.L5
.L2:
	ldrb	w0, [sp, 47]
	eor	w0, w0, 1
	and	w0, w0, 255
	cmp	w0, 0
	bne	.L3
	ldr	x0, [sp, 64]
	bl	SDL_DestroyRenderer
	ldr	x0, [sp, 72]
	bl	SDL_DestroyRenderer
	ldr	x0, [sp, 56]
	bl	SDL_DestroyWindow
	bl	SDL_Quit
	mov	w0, 0
	mov	w1, w0
	adrp	x0, :got:__stack_chk_guard
	ldr	x0, [x0, :got_lo12:__stack_chk_guard]
	ldr	x3, [sp, 168]
	ldr	x2, [x0]
	subs	x3, x3, x2
	mov	x2, 0
	beq	.L8
	bl	__stack_chk_fail
.L8:
	mov	w0, w1
	ldp	x29, x30, [sp], 176
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5337:
	.size	main, .-main
	.ident	"GCC: (GNU) 12.1.0"
	.section	.note.GNU-stack,"",@progbits
