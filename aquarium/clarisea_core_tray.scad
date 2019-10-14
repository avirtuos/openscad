
x=25.4*9.25;
y=25.4*9.25;
z=25.4*.3;
cutout_x=180;
cutout_y=196;
spill_bar_z=25.4*2;
spill_bar_x=25.4*.25;
spacer_y=13;

float_x=3;
float_y=25.4*1;
float_z=25.4*2;
float_guide=3.5;

translate([spill_bar_x-float_x,y/2,spill_bar_z-float_z*.05]){
    difference(){
        color("green")
        cube([float_x,float_y,float_z]);

        color("purple")
        translate([-1,float_y/2-float_guide/2,float_z*.1])
        cube([float_x+2,float_guide,float_z*.8]);
    }
}

union(){
    translate([17,16,0])
    color("green")
    import("../../STLs/clarisea_roll_mount.stl");

    translate([17,y-54,0])
    color("red")
    import("../../STLs/clarisea_roll_mount.stl");

    difference(){
        union(){
            cube([x,y,z]);
            
            difference(){
            cube([spill_bar_x,y,spill_bar_z]);
            
            translate([-1,0,z])
            color("blue")
            cube([spill_bar_x+2, spacer_y, spill_bar_z]);
            }
        }

        translate([(x-cutout_x)/2,(y-cutout_y)/2,-1])
        color("red")
        cube([cutout_x, cutout_y, z +2]);
    }
}