inline primitive generators generated code
genLowcodeFloat32Div
	<option: #LowcodeVM>	"Lowcode instruction generator"
	| second first |

	(second := backEnd availableFloatRegisterOrNoneFor: self liveFloatRegisters) = NoReg ifTrue:
		[self ssAllocateRequiredFloatReg: (second := DPFPReg0)].

	(first := backEnd availableFloatRegisterOrNoneFor: (self liveFloatRegisters bitOr: (self registerMaskFor: second))) = NoReg ifTrue:
		[self ssAllocateRequiredFloatReg: (first := DPFPReg1)].
	self ssNativeTop nativePopToReg: second.
	self ssNativePop: 1.
	self ssNativeTop nativePopToReg: first.
	self ssNativePop: 1.

	self DivRs: second Rs: first.
	self ssPushNativeRegisterSingleFloat: first.

	^ 0

