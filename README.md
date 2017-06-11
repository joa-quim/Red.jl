# Red.jl
A Julia wrapper for the [Red](http://www.red-lang.org//) API library.

[![Build Status](https://travis-ci.org/joa-quim/Red.jl.svg?branch=master)](https://travis-ci.org/joa-quim/Red.jl)



Install
=======

    Pkg.clone("git://github.com/joa-quim/Red.jl.git")

WARNING: Since Red System (Alpha release) is currently 32-bit only, this package MUST be run from a Julia 32-bit version.


Using
=====

First of all you must generate a cdecl libRed.dll. You do that from the command line (the cmd shell) by runing ``red-11jun17-4045791.exe build libRed``. Here a daily release was used (after ``0.6.2``) because the ``redBinary() and redImage()`` functions were added after ``0.6.2``.

Having your ``Red`` directory in the path, currently, you must also also edit the file red_h.jl and point the first line to the place where the ``libRed.dll`` can be found. Now

The classic "Hellow World" example

    using Red
    redOpen()
    redDo("view [{Hello World}]");
    redClose()

Visualize a random *image*

    using Red
    redOpen()
    img = rand(UInt32, 128,128);    # Generate a random 'image' array
    redSet(redSymbol("img"), redImage(128, 128, img, 0));
    redDo("view [image img]");
    redClose()
