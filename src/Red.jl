VERSION >= v"0.5" && __precompile__()

module Red

export
    redOpen, redClose, redDo, redDoFile, redDoBlock, redRoutine, redSymbol, redUnset,
    redNone, redLogic, redDatatype, redInteger, redFloat, redPair, redTouple, redTouple4,
	redBinary, redString, redWord, redLoadPath, redMakeSeries,
    redGet, redSet, redSetPath, redGetPath, redPrint, redProbe, redFormError,
    redOpenLogWindow, redCloseLogWindow, redOpenLogFile, redCloseLogFile

include("red_h.jl")

end # module
