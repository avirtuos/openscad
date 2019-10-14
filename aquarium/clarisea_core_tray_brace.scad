

min_z=150;
roll_diameter=150;
roll_screw_guide_z=25.4*.75;
screw_guide=9;

roll_mount_thickness=25.4*.4;
roll_mount_width=25.4*2;
roll_mount_z= roll_diameter/2 + min_z + roll_screw_guide_z;

cutout_x=180;

brace_z = 5*25.4;
brace_y=roll_mount_width +25.4/2;


difference(){
    union(){
        color("green"){
        translate([roll_mount_thickness*1.15,10,min_z-brace_z*.75])

        cube([roll_mount_thickness * 2, brace_y, brace_z]);

        translate([-10,35,min_z-40])
        rotate([0,30,0])
        cube([250, 12.5, 25.4*2]);
        }
    }
    color("red"){
        translate([180,30,-29])
        cube([50,50,30]);
    }
        color("red"){
        translate([-13.35,30,90])
        cube([25,50,60]);
    }
    translate([15.5,15,0])
color("red")
    cube([12,53,300]);
import("../../STLs/clarisea_core_tray_w_mounts.stl");
    
    color("red"){
    translate([205,30,0])
    cube([20,20,10]);
    }
    
    
}


/*
translate([40,45,roll_mount_z-20]){
rotate([0,90,0]){
cylinder(r1=150/2,r2=150/2,h=180, $fn=100);

color("red")
cylinder(r1=10,r2=10,h=182, $fn=100);
}}
*/