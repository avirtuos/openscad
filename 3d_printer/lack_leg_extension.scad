ext_z=25.4*4.9;
ext_overlap = 25.4*1.5;
ext_tbl_z = 25.4;
leg_y=52;
leg_x=52;
wall = 7; 

screw_r = 3.9/2;
screw_head_r = 7.3/2;
screw_head_h = 2.5;

difference(){
    translate([-wall,-wall,ext_tbl_z])
    cube([leg_x + (wall*2), leg_y + (wall*2), ext_z + ext_overlap + ext_tbl_z]);
    
    color("red")
    union(){
        translate([0,0,ext_tbl_z*2 + ext_z])
        cube([leg_x, leg_y, ext_z *2]);
        cube([leg_x *10, leg_y*10, ext_tbl_z*2]);
    }
     
    translate([12,-4.6,ext_tbl_z*1.6])
    screw();
    translate([27,-4.6,ext_tbl_z*1.6])
    screw();
    translate([42,-4.6,ext_tbl_z*1.6])
    screw();

    translate([12,-4.6,ext_z*1.6])
    screw();
    translate([27,-4.6,ext_z*1.6])
    screw();
    translate([42,-4.6,ext_z*1.6])
    screw();

    translate([-4.6,12,ext_tbl_z*1.4])
    screw(0);
    translate([-4.6,27,ext_tbl_z*1.4])
    screw(0);
    translate([-4.6,42,ext_tbl_z*1.4])
    screw(0);

    translate([-4.6,12,ext_z*1.52])
    screw(0);
    translate([-4.6,27,ext_z*1.52])
    screw(0);
    translate([-4.6,42,ext_z*1.52])
    screw(0);
}


module screw(rotation = -90){
    color("green")
    rotate([rotation,90,0]){
    cylinder(h=25.4, r1 = screw_r, r2 = screw_r-.25, $fn=100);
    translate([0,0,-screw_head_h])
    cylinder(h=screw_head_h, r1 = screw_head_r, r2 = screw_head_r-.3, $fn=100);
    }
}