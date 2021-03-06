primitives-accessing
primUnsignedByteAt
	"Answer the unsigned 8-bit integer starting at the given byte offset (little endian)."
	"<Alien> unsignedByteAt: index <Integer> ^<Integer>
		<primitive: 'primUnsignedByteAt' error: errorCode module: 'IA32ABI'>"
	| byteOffset rcvr startAddr addr value valueOop |
	<export: true>
	<var: #value type: 'unsigned char '>

	byteOffset := (interpreterProxy stackPositiveMachineIntegerValue: 0) - 1.
	rcvr := interpreterProxy stackObjectValue: 1.
	interpreterProxy failed ifTrue:
		[^interpreterProxy primitiveFailFor: PrimErrBadArgument].
	(self index: byteOffset length: 1 inRange: rcvr) ifFalse:
		[^interpreterProxy primitiveFailFor: PrimErrBadIndex].
	(startAddr := self startOfData: rcvr) = 0 ifTrue:
		[^interpreterProxy primitiveFailFor: PrimErrBadReceiver].
	addr := startAddr + byteOffset.
	value := self byteAt: addr.
	valueOop := interpreterProxy positive32BitIntegerFor: value.
	^interpreterProxy methodReturnValue: valueOop