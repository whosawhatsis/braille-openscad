include <braillechars.scad>; // see braillechars.scad for list of supported characters

string = [
	[a,b,c,d,e,f,g,h,i,j,k,l,m],
	[n,o,p,q,r,s,t,u,v,w,x,y,z]
];

dotheight = .6;//.48;
dotdiameter = 1.44;
dotspacing = 2.34;
cellspacing = 6.2;
margin = 3.5;
linetoline = 10;
fontsize = 15;
letterthick = .5;
tilethick = 4 ;
tileround = 2;

for(i = [0:len(string) - 1], j = [0:len(string[i]) - 1]) translate([i * (fontsize + margin * 2 + 3), j * (tilethick + max(letterthick, 0) + 3), 0]) rotate([90, 0, 0]) tile(string[i][j]);

$fs = .5;
$fa = 2;

module braillechar(letter = w, $fs = .2, $fa = .2) {
	for(i = [0:5]) if((floor(letter / pow(2, i)) % 2)) translate([floor(i / 3) * dotspacing, (i % 3) * -dotspacing, 0]) scale([1, 1, 2 * dotheight/dotdiameter]) rotate([90, 0, 0]) sphere(d = dotdiameter);
}

module braillestr(string) {
	for(i = [0:100]) translate([i * cellspacing, 0, 0]) braillechar(string[i]);
}

*rotate([90, 0, 0]) {
	for(i = [0:len(string) - 1]) translate([margin, dotspacing * 2 + margin + (len(string) - i - 1) * linetoline, 0]) braillestr(string[i]);
	translate([0, 0, -5]) difference() {
		cube([dotspacing + cellspacing * (max([for(i = [0:len(string) - 1]) len(string[i])]) - 1) + margin * 2, dotspacing * 2 + margin * 2 + linetoline * (len(string) - 1), 5]);
		translate([0, margin + dotspacing * 2 + linetoline * (len(string) - 1), -1]) rotate(45) cube([margin * sqrt(2), margin, 7]);
	}
}

function letter(letter) = 
		(letter == a) ? "a" :
		(letter == b) ? "b" :
		(letter == c) ? "c" :
		(letter == d) ? "d" :
		(letter == e) ? "e" :
		(letter == f) ? "f" :
		(letter == g) ? "g" :
		(letter == h) ? "h" :
		(letter == i) ? "i" :
		(letter == j) ? "j" :
		(letter == k) ? "k" :
		(letter == l) ? "l" :
		(letter == m) ? "m" :
		(letter == n) ? "n" :
		(letter == o) ? "o" :
		(letter == p) ? "p" :
		(letter == q) ? "q" :
		(letter == r) ? "r" :
		(letter == s) ? "s" :
		(letter == t) ? "t" :
		(letter == u) ? "u" :
		(letter == v) ? "v" :
		(letter == w) ? "w" :
		(letter == x) ? "x" :
		(letter == y) ? "y" :
		(letter == z) ? "z" :
		"?";

module tile(letter) {
	difference() {
		linear_extrude(tilethick, convexity = 5) translate([-fontsize / 2 - margin, 0, 0]) offset(tileround)  offset(-tileround) square([fontsize + margin * 2, dotspacing * 2 + margin * 2 + fontsize * 1.5]);
		if(letterthick < 0) translate([0, dotspacing * 2 + margin + fontsize * .5, tilethick + letterthick]) linear_extrude(tilethick - letterthick) text(letter(letter), halign = "center", size = fontsize);
	}
	if(letterthick > 0) translate([0, dotspacing * 2 + margin + fontsize * .5, 0]) linear_extrude(tilethick + letterthick) text(letter(letter), halign = "center", size = fontsize);
	translate([-dotspacing / 2, dotspacing * 2 + margin, tilethick]) braillechar(letter);
}