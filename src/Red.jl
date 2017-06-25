VERSION >= v"0.5" && __precompile__()

module Red

export
    redOpen, redClose, redDo, redDoFile, redDoBlock, redCall, redRoutine, redSymbol, redUnset,
    redNone, redLogic, redDatatype, redInteger, redFloat, redPair, redTuple, redTuple4,
	redBinary, redImage, redString, redWord, redBlock, redPath, redLoadPath, redMakeSeries,
    redGet, redSet, redSetPath, redGetPath, redSetField, redGetField, redPrint, redProbe, redFormError,
    redOpenLogWindow, redCloseLogWindow, redOpenLogFile, redCloseLogFile,
    redCInt32, redCDouble, redCString, redTypeOf

include("red_h.jl")

end # module
