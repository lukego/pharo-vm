memory access
long32At: byteAddress
	"Answer the 32-bit word at byteAddress which must be 0 mod 4."

	^self longAt: byteAddress