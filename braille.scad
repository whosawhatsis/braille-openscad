dotheight = .6;//.48;
dotdiameter = 1.44;
dotspacing = 2.34;
cellspacing = 6.2;
margin = 3.5;

_ = 0;

a = 1;
b = 3;
c = 9;
d = 25;
e = 17;
f = 11;
g = 27;
h = 19;
i = 10;
j = 26;

k = 1 + 4;
l = 3 + 4;
m = 9 + 4;
n = 25 + 4;
o = 17 + 4;
p = 11 + 4;
q = 27 + 4;
r = 19 + 4;
s = 10 + 4;
t = 26 + 4;

u = 1 + 4 + 32;
v = 3 + 4 + 32;
x = 9 + 4 + 32;
y = 25 + 4 + 32;
z = 17 + 4 + 32;

w = 26 + 32;

COMMA = 2;
AT = 8;
SLASH = 12;
COLON = 18;
BANG = 22;
CAP = 32;
HYPHEN = 36;
QMARK = 38;
PLUS = 44;
DOT = 50;
HASH = 60;


string = [CAP,h,e,l,l,o,COMMA,_,w,o,r,l,d,BANG];


module braillechar(letter = w, $fs = .2, $fa = .2) {
	for(i = [0:5]) if((floor(letter / pow(2, i)) % 2)) translate([floor(i / 3) * dotspacing, (i % 3) * -dotspacing, 0]) scale([1, 1, 2 * dotheight/dotdiameter]) rotate([90, 0, 0]) sphere(d = dotdiameter);
}
module braillestr(string) {
	for(ind = [0:100]) translate([ind * cellspacing, 0, 0]) braillechar(string[ind]);
}

rotate([90, 0, 0]) {
	translate([margin, dotspacing * 2 + margin, 0]) braillestr(string);
	translate([0, 0, -5]) difference() {
		cube([dotspacing + cellspacing * (len(string) - 1) + margin * 2, dotspacing * 2 + margin * 2, 5]);
		translate([0, margin + dotspacing * 2, -1]) rotate(45) cube([margin * sqrt(2), margin, 7]);
	}
}

