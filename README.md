# Red.jl
Julia wrapper for the [Red](http://www.red-lang.org//) API library

[![Build Status](https://travis-ci.org/joa-quim/Red.jl.svg?branch=master)](https://travis-ci.org/joa-quim/Red.jl)



Install
=======

    Pkg.clone("git://github.com/joa-quim/Red.jl.git")

WARNING: Sind the Red System is currently a 32 bits only this package MUST be run from a 32 bits Julia version.


Using
=====

First of all you must generate a cdecl libRed.dll. You do that from the command line (the cmd shell) by runing ``red-08jun17-711906d.exe build libRed``. Here a daily release was used (after ``0.6.2``) because the ``redBinary()`` function was added after ``0.6.2``.

Having your ``Red`` directory in the path, currently, you must also also edit the file red_h.jl and point the first line to the place where the ``libRed.dll`` can be found. Now

    using Red
    redOpen()
    img = rand(UInt8, 16,16);       # Generate a random 'image' array
    bin = redBinary(img, 16*16);    # Send the img array to Red
    redProbe(bin);                  # Check that data arrived in Red
    redClose()
