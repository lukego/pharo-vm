inline primitive generated code
lowcodePrimitiveDiv64
	<option: #LowcodeVM>	"Lowcode instruction generator"
	| second result first |
	<var: #second type: #'sqLong' >
	<var: #result type: #'sqLong' >
	<var: #first type: #'sqLong' >
	second := self internalPopStackInt64.
	first := self internalPopStackInt64.

	result := first // second.

	self internalPushInt64: result.

