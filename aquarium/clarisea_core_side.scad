inner_thickness=3;
inner_overlap=20;
inner_x=25.4*6.5+(3*inner_thickness);
inner_y=25.4*7.5;
inner_z=25.4*8;

union(){
cube([inner_thickness, inner_y+inner_thickness, inner_z]);
translate([0,0,inner_z])
color("green")
cube([inner_thickness*2, inner_y+inner_thickness,inner_thickness]);
    }