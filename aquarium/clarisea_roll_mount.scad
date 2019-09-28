
min_z=150;
roll_diameter=150;
roll_screw_guide_z=25.4*.75;
screw_guide=9;

roll_mount_thickness=25.4*.4;
roll_mount_width=25.4*2;
roll_mount_z= roll_diameter/2 + min_z + roll_screw_guide_z;


difference(){
union(){
cube([roll_mount_thickness,roll_mount_width,roll_mount_z]);
translate([-roll_mount_thickness,0,0])
cube([roll_mount_thickness*2,roll_mount_width,roll_mount_z/6]);
}
 
color("red")
translate([-1, roll_mount_width/2, roll_mount_z - roll_screw_guide_z*1.2 + 1])
rotate([45,0,0])
cube([roll_mount_thickness+2, screw_guide, roll_screw_guide_z+15]);
}
echo(roll_mount_z);