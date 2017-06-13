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

Now, I am so thrilled that the next worked that I'll show it even than there are several things that need fixes/learning. The example shows how we can use [GMT.jl](https://github.com/joa-quim/GMT.jl) to create a world topography map and use the image computed in **GMT** to display in a **Red** window.

   using GMT, Red
   gmt("grdimage earth_relief_10m.grd -I+ -Rd -JR5c");  # Download the  *earth_relief_10m.grd* from the GMT server and make a PS image
   I = gmt("psconvert = -A");                           # Convert the PostScript file in memory into a raster (a Ghostscript work)
   size(I.image)                                        # Inquire the size of image (= 3,361,591)
   redSet(redSymbol("I.image"), redImage(361, 591, I.image, 0));  # Send image to Red
   redDo("view [image I.image]");                       # and view it.
   redClose()

Colors are not right but who cares at this point.
![Screenshot](http://w3.ualg.pt/~jluis/first_GMT_Julia_Red.jpg)