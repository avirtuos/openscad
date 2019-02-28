
color("red")
linear_extrude(height=.2)
translate([-.35,.15,0])
import(file="rover_base.dxf");
translate([0,0,.2])
linear_extrude(height=2)
import(file="rover.dxf");