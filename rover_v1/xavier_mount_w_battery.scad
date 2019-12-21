


difference(){
union(){
cube([105,105,6]);
translate([0,-20,0])
cube([105,20,1]);
}
translate([5.5,5.5,-.1])
color("green")
cylinder(r2=2,r1=3.5,h=10,$fn=100);

translate([105-5.5,105-20,-.1])
color("red")
cylinder(r2=2,r1=3.5,h=10,$fn=100);

translate([5.5,105-20,-.1])
color("red")
cylinder(r2=2,r1=3.5,h=10,$fn=100);


translate([105-5.5,5.5,-.1])
color("green")
cylinder(r2=2,r1=3.5,h=10,$fn=100);


translate([15,5,-1])
cube([75,95,8]);
}