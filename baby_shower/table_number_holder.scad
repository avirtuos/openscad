

difference(){
translate([0,0,11])
rotate([45,-35,00])
union(){
cylinder(40,40,00,$fn=4);
rotate([180,0,0])
cylinder(40,40,00,$fn=4);
}

translate([3,-50,13])
color("red")
cube([1,100,100]);
}