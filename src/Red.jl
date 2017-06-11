VERSION >= v"0.5" && __precompile__()

module Red

export
    redOpen, redClose, redDo, redDoFile, redDoBlock, redCall, redRoutine, redSymbol, redUnset,
    redNone, redLogic, redDatatype, redInteger, redFloat, redPair, redTuple, redTuple4,
	redBinary, redString, redWord, redBlock, redLoadPath, redMakeSeries,
    redGet, redSet, redSetPath, redGetPath, redPrint, redProbe, redFormError,
    redOpenLogWindow, redCloseLogWindow, redOpenLogFile, redCloseLogFile

include("red_h.jl")

end # module
