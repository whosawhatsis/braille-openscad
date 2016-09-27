These files use the OpenSCAD free, open source CAD program to create Braille letters. To download OpenSCAD, go to www.OpenSCAD.org. There is a manual there about the program. Once you have downloaded it, you can edit one of the files here to create any letter or letters you like in Braille.

To create a 3D printable .stl file, open the file braille.scad in OpenSCAD. At the top of the file you see this: 

string = [
	[CAP,h,e,l,l,o,COMMA,_,w,o,r,l,d,BANG],
	[CAP,h,e,l,l,o,BANG],
	[CAP,w,o,r,l,d,BANG]
];

This will print a multi-line card that says:

Hello, world!
Hello!
World!

To print out something else, change the letters to what you want, being sure to separate them with commas. In addition to letters, some special characters are available. You will find a list in braillechars.scad.

To create an STL once you have changed it, click on the render key (a cube with an hourglass) and then the STL file. 
