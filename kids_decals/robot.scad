
color("black")
translate([25,25,0])
cube([130,132,.2]);
translate([0,0,.2])
linear_extrude(height=1.4)
import(file="robot.dxf");