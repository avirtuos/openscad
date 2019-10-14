inner_thickness=3;
z=27.9;
x=70;
y=28;

difference(){
cube([x,y,z]);
color("red")
translate([-.1,.1+y-inner_thickness*5,-.1])
cube([x+.2,inner_thickness*5,inner_thickness+2]);
    translate([0,10,z])
rotate([-45,0,0])
color("green")
cube([x,y,z]);
}

