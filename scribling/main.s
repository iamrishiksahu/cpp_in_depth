	.file	"main.cpp"
# GNU C++17 (Ubuntu 14.2.0-4ubuntu2~24.04) version 14.2.0 (x86_64-linux-gnu)
#	compiled by GNU C version 14.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -foffload-options=-l_GCC_m -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.section	.text._ZNSt11char_traitsIcE6lengthEPKc,"axG",@progbits,_ZNSt11char_traitsIcE6lengthEPKc,comdat
	.weak	_ZNSt11char_traitsIcE6lengthEPKc
	.type	_ZNSt11char_traitsIcE6lengthEPKc, @function
_ZNSt11char_traitsIcE6lengthEPKc:
.LFB1106:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# __s, __s
# /usr/include/x86_64-linux-gnu/c++/14/bits/c++config.h:550:     return __builtin_is_constant_evaluated();
	movl	$0, %eax	#, D.91604
# /usr/include/c++/14/bits/char_traits.h:388: 	if (std::__is_constant_evaluated())
	testb	%al, %al	# D.91604
	je	.L3	#,
# /usr/include/c++/14/bits/char_traits.h:389: 	  return __gnu_cxx::char_traits<char_type>::length(__s);
	movq	-8(%rbp), %rax	# __s, tmp101
	movq	%rax, %rdi	# tmp101,
	call	_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc	#
# /usr/include/c++/14/bits/char_traits.h:389: 	  return __gnu_cxx::char_traits<char_type>::length(__s);
	jmp	.L4	#
.L3:
# /usr/include/c++/14/bits/char_traits.h:391: 	return __builtin_strlen(__s);
	movq	-8(%rbp), %rax	# __s, tmp103
	movq	%rax, %rdi	# tmp103,
	call	strlen@PLT	#
# /usr/include/c++/14/bits/char_traits.h:391: 	return __builtin_strlen(__s);
	nop	
.L4:
# /usr/include/c++/14/bits/char_traits.h:392:       }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1106:
	.size	_ZNSt11char_traitsIcE6lengthEPKc, .-_ZNSt11char_traitsIcE6lengthEPKc
#APP
	.globl _ZSt21ios_base_library_initv
#NO_APP
	.text
	.align 2
	.type	_ZZ4mainEN10SingleDataC2Ec, @function
_ZZ4mainEN10SingleDataC2Ec:
.LFB4012:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# this, this
	movl	%esi, %eax	# cx, tmp98
	movb	%al, -12(%rbp)	# tmp99, cx
# ./main.cpp:22:             this->c = cx;
	movq	-8(%rbp), %rax	# this, tmp100
	movzbl	-12(%rbp), %edx	# cx, tmp101
	movb	%dl, (%rax)	# tmp101, this_2(D)->c
# ./main.cpp:23:         }
	nop	
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE4012:
	.size	_ZZ4mainEN10SingleDataC2Ec, .-_ZZ4mainEN10SingleDataC2Ec
	.set	_ZZ4mainEN10SingleDataC1Ec,_ZZ4mainEN10SingleDataC2Ec
	.section	.rodata
.LC0:
	.string	"hello"
.LC1:
	.string	"a: ["
.LC2:
	.string	"]\n"
.LC3:
	.string	"b: ["
.LC4:
	.string	"asdfasdf"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4010:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4010
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$152, %rsp	#,
	.cfi_offset 3, -24
# ./main.cpp:10: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp114
	movq	%rax, -24(%rbp)	# tmp114, D.91662
	xorl	%eax, %eax	# tmp114
# ./main.cpp:29:     std::cout << sizeof(Parent) << std::endl;
	movl	$1, %esi	#,
	leaq	_ZSt4cout(%rip), %rax	#, tmp115
	movq	%rax, %rdi	# tmp115,
.LEHB0:
	call	_ZNSolsEm@PLT	#
# ./main.cpp:29:     std::cout << sizeof(Parent) << std::endl;
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rdx	#, tmp117
	movq	%rdx, %rsi	# tmp116,
	movq	%rax, %rdi	# _1,
	call	_ZNSolsEPFRSoS_E@PLT	#
# ./main.cpp:30:     std::cout << sizeof(SingleData) << std::endl;
	movl	$1, %esi	#,
	leaq	_ZSt4cout(%rip), %rax	#, tmp118
	movq	%rax, %rdi	# tmp118,
	call	_ZNSolsEm@PLT	#
# ./main.cpp:30:     std::cout << sizeof(SingleData) << std::endl;
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rdx	#, tmp120
	movq	%rdx, %rsi	# tmp119,
	movq	%rax, %rdi	# _2,
	call	_ZNSolsEPFRSoS_E@PLT	#
# ./main.cpp:33:     SingleData sd1 = std::move(*(new SingleData()));
	movl	$1, %edi	#,
	call	_Znwm@PLT	#
.LEHE0:
# ./main.cpp:33:     SingleData sd1 = std::move(*(new SingleData()));
	movb	$0, (%rax)	#, MEM[(struct SingleData *)_22].c
# ./main.cpp:33:     SingleData sd1 = std::move(*(new SingleData()));
	movq	%rax, %rdi	# _21,
	call	_ZSt4moveIRZ4mainE10SingleDataEONSt16remove_referenceIT_E4typeEOS3_	#
# ./main.cpp:33:     SingleData sd1 = std::move(*(new SingleData()));
	movzbl	(%rax), %eax	# MEM[(struct SingleData &)_3], tmp122
	movb	%al, -146(%rbp)	# tmp122, sd1
	leaq	-145(%rbp), %rax	#, tmp123
	movq	%rax, -144(%rbp)	# tmp123, this
# /usr/include/c++/14/bits/new_allocator.h:88:       __new_allocator() _GLIBCXX_USE_NOEXCEPT { }
	nop	
# /usr/include/c++/14/bits/allocator.h:161:       allocator() _GLIBCXX_NOTHROW { }
	nop	
# ./main.cpp:35:     std::string a = "hello";
	leaq	-145(%rbp), %rdx	#, tmp124
	leaq	-128(%rbp), %rax	#, tmp125
	leaq	.LC0(%rip), %rcx	#, tmp126
	movq	%rcx, %rsi	# tmp126,
	movq	%rax, %rdi	# tmp125,
.LEHB1:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_	#
.LEHE1:
# /usr/include/c++/14/bits/allocator.h:182:       ~allocator() _GLIBCXX_NOTHROW { }
	leaq	-145(%rbp), %rax	#, tmp127
	movq	%rax, %rdi	# tmp127,
	call	_ZNSt15__new_allocatorIcED2Ev	#
	nop	
# ./main.cpp:36:     std::string b = std::move(a);
	leaq	-128(%rbp), %rax	#, tmp128
	movq	%rax, %rdi	# tmp128,
	call	_ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_	#
	movq	%rax, %rdx	#, _4
# ./main.cpp:36:     std::string b = std::move(a);
	leaq	-96(%rbp), %rax	#, tmp129
	movq	%rdx, %rsi	# _4,
	movq	%rax, %rdi	# tmp129,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1EOS4_@PLT	#
# ./main.cpp:38:     std::cout << "a: [" << a << "]\n"; // a is in a valid but unspecified state
	leaq	.LC1(%rip), %rax	#, tmp130
	movq	%rax, %rsi	# tmp130,
	leaq	_ZSt4cout(%rip), %rax	#, tmp131
	movq	%rax, %rdi	# tmp131,
.LEHB2:
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
	movq	%rax, %rdx	#, _5
# ./main.cpp:38:     std::cout << "a: [" << a << "]\n"; // a is in a valid but unspecified state
	leaq	-128(%rbp), %rax	#, tmp132
	movq	%rax, %rsi	# tmp132,
	movq	%rdx, %rdi	# _5,
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT	#
	movq	%rax, %rdx	#, _6
# ./main.cpp:38:     std::cout << "a: [" << a << "]\n"; // a is in a valid but unspecified state
	leaq	.LC2(%rip), %rax	#, tmp133
	movq	%rax, %rsi	# tmp133,
	movq	%rdx, %rdi	# _6,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
# ./main.cpp:39:     std::cout << "b: [" << b << "]\n"; // b == "hello"
	leaq	.LC3(%rip), %rax	#, tmp134
	movq	%rax, %rsi	# tmp134,
	leaq	_ZSt4cout(%rip), %rax	#, tmp135
	movq	%rax, %rdi	# tmp135,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
	movq	%rax, %rdx	#, _7
# ./main.cpp:39:     std::cout << "b: [" << b << "]\n"; // b == "hello"
	leaq	-96(%rbp), %rax	#, tmp136
	movq	%rax, %rsi	# tmp136,
	movq	%rdx, %rdi	# _7,
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT	#
	movq	%rax, %rdx	#, _8
# ./main.cpp:39:     std::cout << "b: [" << b << "]\n"; // b == "hello"
	leaq	.LC2(%rip), %rax	#, tmp137
	movq	%rax, %rsi	# tmp137,
	movq	%rdx, %rdi	# _8,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
.LEHE2:
	leaq	-145(%rbp), %rax	#, tmp138
	movq	%rax, -136(%rbp)	# tmp138, this
# /usr/include/c++/14/bits/new_allocator.h:88:       __new_allocator() _GLIBCXX_USE_NOEXCEPT { }
	nop	
# /usr/include/c++/14/bits/allocator.h:161:       allocator() _GLIBCXX_NOTHROW { }
	nop	
# ./main.cpp:41:     std::string sx{"asdfasdf"};
	leaq	-145(%rbp), %rdx	#, tmp139
	leaq	-64(%rbp), %rax	#, tmp140
	leaq	.LC4(%rip), %rcx	#, tmp141
	movq	%rcx, %rsi	# tmp141,
	movq	%rax, %rdi	# tmp140,
.LEHB3:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_	#
.LEHE3:
# /usr/include/c++/14/bits/allocator.h:182:       ~allocator() _GLIBCXX_NOTHROW { }
	leaq	-145(%rbp), %rax	#, tmp142
	movq	%rax, %rdi	# tmp142,
	call	_ZNSt15__new_allocatorIcED2Ev	#
	nop	
# ./main.cpp:42:     std::cout << sx << std::endl;
	leaq	-64(%rbp), %rax	#, tmp143
	movq	%rax, %rsi	# tmp143,
	leaq	_ZSt4cout(%rip), %rax	#, tmp144
	movq	%rax, %rdi	# tmp144,
.LEHB4:
	call	_ZStlsIcSt11char_traitsIcESaIcEERSt13basic_ostreamIT_T0_ES7_RKNSt7__cxx1112basic_stringIS4_S5_T1_EE@PLT	#
# ./main.cpp:42:     std::cout << sx << std::endl;
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rdx	#, tmp146
	movq	%rdx, %rsi	# tmp145,
	movq	%rax, %rdi	# _9,
	call	_ZNSolsEPFRSoS_E@PLT	#
.LEHE4:
# ./main.cpp:44:     SingleData sst{'a'};
	leaq	-145(%rbp), %rax	#, tmp147
	movl	$97, %esi	#,
	movq	%rax, %rdi	# tmp147,
	call	_ZZ4mainEN10SingleDataC1Ec	#
# ./main.cpp:46:     return 0;
	movl	$0, %ebx	#, _48
# ./main.cpp:47: }
	leaq	-64(%rbp), %rax	#, tmp148
	movq	%rax, %rdi	# tmp148,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT	#
# ./main.cpp:47: }
	leaq	-96(%rbp), %rax	#, tmp149
	movq	%rax, %rdi	# tmp149,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT	#
# ./main.cpp:47: }
	leaq	-128(%rbp), %rax	#, tmp150
	movq	%rax, %rdi	# tmp150,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT	#
# ./main.cpp:47: }
	movl	%ebx, %eax	# _48, <retval>
	movq	-24(%rbp), %rdx	# D.91662, tmp166
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp166
	je	.L14	#,
	jmp	.L19	#
.L15:
	endbr64	
# /usr/include/c++/14/bits/allocator.h:182:       ~allocator() _GLIBCXX_NOTHROW { }
	movq	%rax, %rbx	#, tmp153
	leaq	-145(%rbp), %rax	#, tmp152
	movq	%rax, %rdi	# tmp152,
	call	_ZNSt15__new_allocatorIcED2Ev	#
	nop	
	movq	%rbx, %rax	# tmp153, D.91659
	movq	-24(%rbp), %rdx	# D.91662, tmp167
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp167
	je	.L9	#,
	call	__stack_chk_fail@PLT	#
.L9:
	movq	%rax, %rdi	# D.91659,
.LEHB5:
	call	_Unwind_Resume@PLT	#
.L17:
	endbr64	
	movq	%rax, %rbx	#, tmp156
	leaq	-145(%rbp), %rax	#, tmp154
	movq	%rax, %rdi	# tmp154,
	call	_ZNSt15__new_allocatorIcED2Ev	#
	nop	
	jmp	.L11	#
.L18:
	endbr64	
# ./main.cpp:47: }
	movq	%rax, %rbx	#, tmp160
	leaq	-64(%rbp), %rax	#, tmp159
	movq	%rax, %rdi	# tmp159,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT	#
	jmp	.L11	#
.L16:
	endbr64	
	movq	%rax, %rbx	#, tmp155
.L11:
	leaq	-96(%rbp), %rax	#, tmp162
	movq	%rax, %rdi	# tmp162,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT	#
	leaq	-128(%rbp), %rax	#, tmp165
	movq	%rax, %rdi	# tmp165,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEED1Ev@PLT	#
	movq	%rbx, %rax	# tmp163, D.91660
	movq	-24(%rbp), %rdx	# D.91662, tmp168
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp168
	je	.L13	#,
	call	__stack_chk_fail@PLT	#
.L13:
	movq	%rax, %rdi	# D.91660,
	call	_Unwind_Resume@PLT	#
.LEHE5:
.L19:
	call	__stack_chk_fail@PLT	#
.L14:
	movq	-8(%rbp), %rbx	#,
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE4010:
	.section	.gcc_except_table,"a",@progbits
.LLSDA4010:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4010-.LLSDACSB4010
.LLSDACSB4010:
	.uleb128 .LEHB0-.LFB4010
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB4010
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L15-.LFB4010
	.uleb128 0
	.uleb128 .LEHB2-.LFB4010
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L16-.LFB4010
	.uleb128 0
	.uleb128 .LEHB3-.LFB4010
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L17-.LFB4010
	.uleb128 0
	.uleb128 .LEHB4-.LFB4010
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L18-.LFB4010
	.uleb128 0
	.uleb128 .LEHB5-.LFB4010
	.uleb128 .LEHE5-.LEHB5
	.uleb128 0
	.uleb128 0
.LLSDACSE4010:
	.text
	.size	main, .-main
	.section	.text._ZN9__gnu_cxx11char_traitsIcE6lengthEPKc,"axG",@progbits,_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc,comdat
	.align 2
	.weak	_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc
	.type	_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc, @function
_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc:
.LFB4065:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -40(%rbp)	# __p, __p
# /usr/include/c++/14/bits/char_traits.h:199:     char_traits<_CharT>::
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp103
	movq	%rax, -8(%rbp)	# tmp103, D.91669
	xorl	%eax, %eax	# tmp103
# /usr/include/c++/14/bits/char_traits.h:202:       std::size_t __i = 0;
	movq	$0, -16(%rbp)	#, __i
# /usr/include/c++/14/bits/char_traits.h:203:       while (!eq(__p[__i], char_type()))
	jmp	.L21	#
.L22:
# /usr/include/c++/14/bits/char_traits.h:204:         ++__i;
	addq	$1, -16(%rbp)	#, __i
.L21:
# /usr/include/c++/14/bits/char_traits.h:203:       while (!eq(__p[__i], char_type()))
	movb	$0, -17(%rbp)	#, D.85459
# /usr/include/c++/14/bits/char_traits.h:203:       while (!eq(__p[__i], char_type()))
	movq	-40(%rbp), %rdx	# __p, tmp104
	movq	-16(%rbp), %rax	# __i, tmp105
	addq	%rax, %rdx	# tmp105, _1
# /usr/include/c++/14/bits/char_traits.h:203:       while (!eq(__p[__i], char_type()))
	leaq	-17(%rbp), %rax	#, tmp106
	movq	%rax, %rsi	# tmp106,
	movq	%rdx, %rdi	# _1,
	call	_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_	#
# /usr/include/c++/14/bits/char_traits.h:203:       while (!eq(__p[__i], char_type()))
	xorl	$1, %eax	#, retval.2_10
	testb	%al, %al	# retval.2_10
	jne	.L22	#,
# /usr/include/c++/14/bits/char_traits.h:205:       return __i;
	movq	-16(%rbp), %rax	# __i, _12
# /usr/include/c++/14/bits/char_traits.h:206:     }
	movq	-8(%rbp), %rdx	# D.91669, tmp108
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp108
	je	.L24	#,
	call	__stack_chk_fail@PLT	#
.L24:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE4065:
	.size	_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc, .-_ZN9__gnu_cxx11char_traitsIcE6lengthEPKc
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD5Ev,comdat
	.align 2
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev:
.LFB4163:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
	movq	%rdi, -24(%rbp)	# this, this
	movq	-24(%rbp), %rax	# this, tmp98
	movq	%rax, -8(%rbp)	# tmp98, this
# /usr/include/c++/14/bits/allocator.h:182:       ~allocator() _GLIBCXX_NOTHROW { }
	movq	-8(%rbp), %rax	# this, tmp99
	movq	%rax, %rdi	# tmp99,
	call	_ZNSt15__new_allocatorIcED2Ev	#
	nop	
# /usr/include/c++/14/bits/basic_string.h:186:       struct _Alloc_hider : allocator_type // TODO check __is_final
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE4163:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD1Ev
	.set	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD1Ev,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD2Ev
	.section	.rodata
	.align 8
.LC5:
	.string	"basic_string: construction from null is not valid"
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC5IS3_EEPKcRKS3_,comdat
	.align 2
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_:
.LFB4353:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4353
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$56, %rsp	#,
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)	# this, this
	movq	%rsi, -48(%rbp)	# __s, __s
	movq	%rdx, -56(%rbp)	# __a, __a
# /usr/include/c++/14/bits/basic_string.h:647:       : _M_dataplus(_M_local_data(), __a)
	movq	-40(%rbp), %rbx	# this, _1
	movq	-40(%rbp), %rax	# this, tmp104
	movq	%rax, %rdi	# tmp104,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_local_dataEv@PLT	#
	movq	%rax, %rcx	#, _2
# /usr/include/c++/14/bits/basic_string.h:647:       : _M_dataplus(_M_local_data(), __a)
	movq	-56(%rbp), %rax	# __a, tmp105
	movq	%rax, %rdx	# tmp105,
	movq	%rcx, %rsi	# _2,
	movq	%rbx, %rdi	# _1,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderC1EPcRKS3_@PLT	#
# /usr/include/c++/14/bits/basic_string.h:650: 	if (__s == 0)
	cmpq	$0, -48(%rbp)	#, __s
	jne	.L27	#,
# /usr/include/c++/14/bits/basic_string.h:651: 	  std::__throw_logic_error(__N("basic_string: "
	leaq	.LC5(%rip), %rax	#, tmp106
	movq	%rax, %rdi	# tmp106,
.LEHB6:
	call	_ZSt19__throw_logic_errorPKc@PLT	#
.L27:
# /usr/include/c++/14/bits/basic_string.h:653: 	const _CharT* __end = __s + traits_type::length(__s);
	movq	-48(%rbp), %rax	# __s, tmp107
	movq	%rax, %rdi	# tmp107,
	call	_ZNSt11char_traitsIcE6lengthEPKc	#
# /usr/include/c++/14/bits/basic_string.h:653: 	const _CharT* __end = __s + traits_type::length(__s);
	movq	-48(%rbp), %rdx	# __s, tmp111
	addq	%rdx, %rax	# tmp111, __end_15
	movq	%rax, -24(%rbp)	# __end_15, __end
# /usr/include/c++/14/bits/basic_string.h:654: 	_M_construct(__s, __end, forward_iterator_tag());
	movq	-24(%rbp), %rdx	# __end, tmp112
	movq	-48(%rbp), %rcx	# __s, tmp113
	movq	-40(%rbp), %rax	# this, tmp114
	movq	%rcx, %rsi	# tmp113,
	movq	%rax, %rdi	# tmp114,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag	#
.LEHE6:
# /usr/include/c++/14/bits/basic_string.h:655:       }
	jmp	.L30	#
.L29:
	endbr64	
	movq	%rax, %rbx	#, tmp115
	movq	-40(%rbp), %rax	# this, _4
	movq	%rax, %rdi	# _4,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_Alloc_hiderD1Ev	#
	movq	%rbx, %rax	# tmp115, D.91670
	movq	%rax, %rdi	# D.91670,
.LEHB7:
	call	_Unwind_Resume@PLT	#
.LEHE7:
.L30:
	movq	-8(%rbp), %rbx	#,
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE4353:
	.section	.gcc_except_table
.LLSDA4353:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4353-.LLSDACSB4353
.LLSDACSB4353:
	.uleb128 .LEHB6-.LFB4353
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L29-.LFB4353
	.uleb128 0
	.uleb128 .LEHB7-.LFB4353
	.uleb128 .LEHE7-.LEHB7
	.uleb128 0
	.uleb128 0
.LLSDACSE4353:
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC5IS3_EEPKcRKS3_,comdat
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_
	.set	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC1IS3_EEPKcRKS3_,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2IS3_EEPKcRKS3_
	.text
	.type	_ZSt4moveIRZ4mainE10SingleDataEONSt16remove_referenceIT_E4typeEOS3_, @function
_ZSt4moveIRZ4mainE10SingleDataEONSt16remove_referenceIT_E4typeEOS3_:
.LFB4371:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# __t, __t
# /usr/include/c++/14/bits/move.h:127:     { return static_cast<typename std::remove_reference<_Tp>::type&&>(__t); }
	movq	-8(%rbp), %rax	# __t, _2
# /usr/include/c++/14/bits/move.h:127:     { return static_cast<typename std::remove_reference<_Tp>::type&&>(__t); }
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE4371:
	.size	_ZSt4moveIRZ4mainE10SingleDataEONSt16remove_referenceIT_E4typeEOS3_, .-_ZSt4moveIRZ4mainE10SingleDataEONSt16remove_referenceIT_E4typeEOS3_
	.section	.text._ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_,"axG",@progbits,_ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_,comdat
	.weak	_ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_
	.type	_ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_, @function
_ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_:
.LFB4372:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# __t, __t
# /usr/include/c++/14/bits/move.h:127:     { return static_cast<typename std::remove_reference<_Tp>::type&&>(__t); }
	movq	-8(%rbp), %rax	# __t, _2
# /usr/include/c++/14/bits/move.h:127:     { return static_cast<typename std::remove_reference<_Tp>::type&&>(__t); }
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE4372:
	.size	_ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_, .-_ZSt4moveIRNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEEEONSt16remove_referenceIT_E4typeEOS8_
	.section	.text._ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_,"axG",@progbits,_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_,comdat
	.weak	_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_
	.type	_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_, @function
_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_:
.LFB4425:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# __c1, __c1
	movq	%rsi, -16(%rbp)	# __c2, __c2
# /usr/include/c++/14/bits/char_traits.h:137:       { return __c1 == __c2; }
	movq	-8(%rbp), %rax	# __c1, tmp102
	movzbl	(%rax), %edx	# *__c1_4(D), _1
	movq	-16(%rbp), %rax	# __c2, tmp103
	movzbl	(%rax), %eax	# *__c2_5(D), _2
# /usr/include/c++/14/bits/char_traits.h:137:       { return __c1 == __c2; }
	cmpb	%al, %dl	# _2, _1
	sete	%al	#, _6
# /usr/include/c++/14/bits/char_traits.h:137:       { return __c1 == __c2; }
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE4425:
	.size	_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_, .-_ZN9__gnu_cxx11char_traitsIcE2eqERKcS3_
	.section	.text._ZNSt15__new_allocatorIcED2Ev,"axG",@progbits,_ZNSt15__new_allocatorIcED5Ev,comdat
	.align 2
	.weak	_ZNSt15__new_allocatorIcED2Ev
	.type	_ZNSt15__new_allocatorIcED2Ev, @function
_ZNSt15__new_allocatorIcED2Ev:
.LFB4479:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# this, this
# /usr/include/c++/14/bits/new_allocator.h:104:       ~__new_allocator() _GLIBCXX_USE_NOEXCEPT { }
	nop	
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE4479:
	.size	_ZNSt15__new_allocatorIcED2Ev, .-_ZNSt15__new_allocatorIcED2Ev
	.weak	_ZNSt15__new_allocatorIcED1Ev
	.set	_ZNSt15__new_allocatorIcED1Ev,_ZNSt15__new_allocatorIcED2Ev
	.section	.text._ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_,"axG",@progbits,_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC5EPS4_,comdat
	.align 2
	.weak	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_
	.type	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_, @function
_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_:
.LFB4486:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)	# this, this
	movq	%rsi, -16(%rbp)	# __s, __s
# /usr/include/c++/14/bits/basic_string.tcc:239: 	  explicit _Guard(basic_string* __s) : _M_guarded(__s) { }
	movq	-8(%rbp), %rax	# this, tmp98
	movq	-16(%rbp), %rdx	# __s, tmp99
	movq	%rdx, (%rax)	# tmp99, this_2(D)->_M_guarded
# /usr/include/c++/14/bits/basic_string.tcc:239: 	  explicit _Guard(basic_string* __s) : _M_guarded(__s) { }
	nop	
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE4486:
	.size	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_, .-_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_
	.weak	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC1EPS4_
	.set	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC1EPS4_,_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC2EPS4_
	.section	.text._ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev,"axG",@progbits,_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD5Ev,comdat
	.align 2
	.weak	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev
	.type	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev, @function
_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev:
.LFB4489:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4489
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$16, %rsp	#,
	movq	%rdi, -8(%rbp)	# this, this
# /usr/include/c++/14/bits/basic_string.tcc:242: 	  ~_Guard() { if (_M_guarded) _M_guarded->_M_dispose(); }
	movq	-8(%rbp), %rax	# this, tmp100
	movq	(%rax), %rax	# this_5(D)->_M_guarded, _1
# /usr/include/c++/14/bits/basic_string.tcc:242: 	  ~_Guard() { if (_M_guarded) _M_guarded->_M_dispose(); }
	testq	%rax, %rax	# _1
	je	.L41	#,
# /usr/include/c++/14/bits/basic_string.tcc:242: 	  ~_Guard() { if (_M_guarded) _M_guarded->_M_dispose(); }
	movq	-8(%rbp), %rax	# this, tmp101
	movq	(%rax), %rax	# this_5(D)->_M_guarded, _2
# /usr/include/c++/14/bits/basic_string.tcc:242: 	  ~_Guard() { if (_M_guarded) _M_guarded->_M_dispose(); }
	movq	%rax, %rdi	# _2,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_disposeEv@PLT	#
.L41:
# /usr/include/c++/14/bits/basic_string.tcc:242: 	  ~_Guard() { if (_M_guarded) _M_guarded->_M_dispose(); }
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE4489:
	.section	.gcc_except_table
.LLSDA4489:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4489-.LLSDACSB4489
.LLSDACSB4489:
.LLSDACSE4489:
	.section	.text._ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev,"axG",@progbits,_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD5Ev,comdat
	.size	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev, .-_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev
	.weak	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD1Ev
	.set	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD1Ev,_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD2Ev
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag,comdat
	.align 2
	.weak	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag:
.LFB4484:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA4484
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	pushq	%rbx	#
	subq	$104, %rsp	#,
	.cfi_offset 3, -24
	movq	%rdi, -88(%rbp)	# this, this
	movq	%rsi, -96(%rbp)	# __beg, __beg
	movq	%rdx, -104(%rbp)	# __end, __end
# /usr/include/c++/14/bits/basic_string.tcc:221:       basic_string<_CharT, _Traits, _Alloc>::
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp110
	movq	%rax, -24(%rbp)	# tmp110, D.91674
	xorl	%eax, %eax	# tmp110
	movq	-96(%rbp), %rax	# __beg, tmp111
	movq	%rax, -64(%rbp)	# tmp111, MEM[(const char * *)_30]
	movq	-104(%rbp), %rax	# __end, tmp112
	movq	%rax, -56(%rbp)	# tmp112, __last
# /usr/include/c++/14/bits/stl_iterator_base_types.h:240:     { return typename iterator_traits<_Iter>::iterator_category(); }
	nop	
# /usr/include/c++/14/bits/stl_iterator_base_funcs.h:151:       return std::__distance(__first, __last,
	movq	-64(%rbp), %rax	# MEM[(const char * *)_30], __first.6_32
	movq	%rax, -48(%rbp)	# __first.6_32, __first
	movq	-56(%rbp), %rax	# __last, tmp113
	movq	%rax, -40(%rbp)	# tmp113, __last
# /usr/include/c++/14/bits/stl_iterator_base_funcs.h:106:       return __last - __first;
	movq	-40(%rbp), %rax	# __last, tmp114
	subq	-48(%rbp), %rax	# __first, D.91642
# /usr/include/c++/14/bits/stl_iterator_base_funcs.h:152: 			     std::__iterator_category(__first));
	nop	
# /usr/include/c++/14/bits/basic_string.tcc:225: 	size_type __dnew = static_cast<size_type>(std::distance(__beg, __end));
	movq	%rax, -72(%rbp)	# _2, __dnew
# /usr/include/c++/14/bits/basic_string.tcc:227: 	if (__dnew > size_type(_S_local_capacity))
	movq	-72(%rbp), %rax	# __dnew, __dnew.3_3
# /usr/include/c++/14/bits/basic_string.tcc:227: 	if (__dnew > size_type(_S_local_capacity))
	cmpq	$15, %rax	#, __dnew.3_3
	jbe	.L46	#,
# /usr/include/c++/14/bits/basic_string.tcc:229: 	    _M_data(_M_create(__dnew, size_type(0)));
	leaq	-72(%rbp), %rcx	#, tmp115
	movq	-88(%rbp), %rax	# this, tmp116
	movl	$0, %edx	#,
	movq	%rcx, %rsi	# tmp115,
	movq	%rax, %rdi	# tmp116,
.LEHB8:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm@PLT	#
.LEHE8:
	movq	%rax, %rdx	#, _4
# /usr/include/c++/14/bits/basic_string.tcc:229: 	    _M_data(_M_create(__dnew, size_type(0)));
	movq	-88(%rbp), %rax	# this, tmp117
	movq	%rdx, %rsi	# _4,
	movq	%rax, %rdi	# tmp117,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEPc@PLT	#
# /usr/include/c++/14/bits/basic_string.tcc:230: 	    _M_capacity(__dnew);
	movq	-72(%rbp), %rdx	# __dnew, __dnew.4_5
	movq	-88(%rbp), %rax	# this, tmp118
	movq	%rdx, %rsi	# __dnew.4_5,
	movq	%rax, %rdi	# tmp118,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE11_M_capacityEm@PLT	#
	jmp	.L47	#
.L46:
	movq	-88(%rbp), %rax	# this, tmp119
	movq	%rax, -32(%rbp)	# tmp119, this
# /usr/include/c++/14/bits/basic_string.h:360:       }
	nop	
.L47:
# /usr/include/c++/14/bits/basic_string.tcc:245: 	} __guard(this);
	movq	-88(%rbp), %rdx	# this, tmp120
	leaq	-64(%rbp), %rax	#, tmp121
	movq	%rdx, %rsi	# tmp120,
	movq	%rax, %rdi	# tmp121,
	call	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardC1EPS4_	#
# /usr/include/c++/14/bits/basic_string.tcc:247: 	this->_S_copy_chars(_M_data(), __beg, __end);
	movq	-88(%rbp), %rax	# this, tmp122
	movq	%rax, %rdi	# tmp122,
	call	_ZNKSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7_M_dataEv@PLT	#
	movq	%rax, %rcx	#, _6
# /usr/include/c++/14/bits/basic_string.tcc:247: 	this->_S_copy_chars(_M_data(), __beg, __end);
	movq	-104(%rbp), %rdx	# __end, tmp123
	movq	-96(%rbp), %rax	# __beg, tmp124
	movq	%rax, %rsi	# tmp124,
	movq	%rcx, %rdi	# _6,
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_S_copy_charsEPcPKcS7_@PLT	#
# /usr/include/c++/14/bits/basic_string.tcc:249: 	__guard._M_guarded = 0;
	movq	$0, -64(%rbp)	#, MEM[(struct _Guard *)_30]._M_guarded
# /usr/include/c++/14/bits/basic_string.tcc:251: 	_M_set_length(__dnew);
	movq	-72(%rbp), %rdx	# __dnew, __dnew.5_7
	movq	-88(%rbp), %rax	# this, tmp125
	movq	%rdx, %rsi	# __dnew.5_7,
	movq	%rax, %rdi	# tmp125,
.LEHB9:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE13_M_set_lengthEm@PLT	#
.LEHE9:
# /usr/include/c++/14/bits/basic_string.tcc:252:       }
	leaq	-64(%rbp), %rax	#, tmp126
	movq	%rax, %rdi	# tmp126,
	call	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD1Ev	#
	movq	-24(%rbp), %rax	# D.91674, tmp129
	subq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp129
	je	.L50	#,
	jmp	.L52	#
.L51:
	endbr64	
	movq	%rax, %rbx	#, tmp128
	leaq	-64(%rbp), %rax	#, tmp127
	movq	%rax, %rdi	# tmp127,
	call	_ZZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tagEN6_GuardD1Ev	#
	movq	%rbx, %rax	# tmp128, D.91672
	movq	-24(%rbp), %rdx	# D.91674, tmp130
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp130
	je	.L49	#,
	call	__stack_chk_fail@PLT	#
.L49:
	movq	%rax, %rdi	# D.91672,
.LEHB10:
	call	_Unwind_Resume@PLT	#
.LEHE10:
.L52:
	call	__stack_chk_fail@PLT	#
.L50:
	movq	-8(%rbp), %rbx	#,
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE4484:
	.section	.gcc_except_table
.LLSDA4484:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE4484-.LLSDACSB4484
.LLSDACSB4484:
	.uleb128 .LEHB8-.LFB4484
	.uleb128 .LEHE8-.LEHB8
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB9-.LFB4484
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L51-.LFB4484
	.uleb128 0
	.uleb128 .LEHB10-.LFB4484
	.uleb128 .LEHE10-.LEHB10
	.uleb128 0
	.uleb128 0
.LLSDACSE4484:
	.section	.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag,"axG",@progbits,_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag,comdat
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPKcEEvT_S8_St20forward_iterator_tag
	.section	.rodata
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE, @object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE:
	.byte	1
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedImEE, @object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedImEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedImEE:
	.byte	1
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE, @object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE:
	.byte	1
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.globl	__gxx_personality_v0
	.ident	"GCC: (Ubuntu 14.2.0-4ubuntu2~24.04) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
