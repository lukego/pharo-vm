snapshot
writeSnapshot: imageFileName headerFlags: headerFlags screenSize: screenSizeInteger
	heap64
		checkFreeSpace;
		runLeakCheckerForFullGC: true.
	interpreter64
		setImageHeaderFlagsFrom: headerFlags;
		setDisplayForm: nil;
		imageName: imageFileName;
		writeImageFileIO.
	Transcript cr; show: 'Done!'