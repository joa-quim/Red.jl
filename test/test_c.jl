# Raw tests for libRed integration with C language ... except that they are called via the Julia wrapper.

using Red

function add(a, b)
	println(@sprintf("add called! %ld %ld", redCInt32(a), redCInt32(b)))
	redInteger(redCInt32(a) + redCInt32(b))
end

redOpen()
println("redOpen done");

a     = redSymbol("a");
o_b_2 = redSymbol("o_b_2");
print = redSymbol("print");
o_b   = redSymbol("o_b");
b     = redSymbol("b");

redSet(o_b, redLoadPath("o/b"));
redDo("?? o_b");
redSet(o_b_2, redPath(redWord("o"), redWord("b"), redInteger(2)));

redSet(a, redBlock(redInteger(42), redString("hello")));
redDo("?? a foreach v a [probe v]");
redPrint(redGet(a));

value = redDo("\$%\$");
if (redTypeOf(value) == Red.RED_TYPE_ERROR)
	redProbe(value);
end

redProbe(redCall(redWord("what-dir")));
redCall(redWord("print"), redDo("system/version"));
redCall(redGet(print), redFloat(99.0));

cf = cfunction(add, Ptr{Void}, (Ptr{Void},Ptr{Void}));
redRoutine(redWord("c-add"), "[a [integer!] b [integer!]]", cf);
if ((err = redHasError()) != C_NULL)
    redPrint(err);
else
    redDo("probe c-add 2 3 probe :c-add");
end

redDo("o: object [b: {hello}]");
redDo("?? o_b");
redProbe(redGet(o_b));

redProbe(redGet(o_b_2));
redProbe(redGetPath(redGet(o_b_2)));

redSetPath(redGet(o_b), redInteger(123));
redProbe(redGetPath(redGet(o_b)));

obj = redGet(redSymbol("o"));
redProbe(redGetField(obj, b));
redSetField(obj, b, redInteger(99));
redProbe(redGetField(obj, b));

buffer = "12345";
bin = redBinary(buffer, 5);
redProbe(bin);

#redClose();