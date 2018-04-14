use <MCAD/boxes.scad>
use <virtuoso/utils.scad>


rplidar_x = 100;
rplidar_y = 72;
rplidar_assembly_z=37;
circuit_z=5;


rplidar_x_pad=10;
rplidar_y_pad=10;
rplidar_assembly_z_pad=1;
case_thickness=2;

rplidar_case_x=rplidar_x+rplidar_x_pad+(2*case_thickness);
rplidar_case_y=rplidar_y+rplidar_y_pad+(2*case_thickness);
rplidar_case_z=rplidar_assembly_z + rplidar_assembly_z_pad + circuit_z + (2 * case_thickness);
rplidar_case_interior_z=rplidar_assembly_z + rplidar_assembly_z_pad + circuit_z;

difference(){
    
    union(){
        color("red")
        translate([-1*rplidar_x_pad/2,-1*rplidar_y_pad/2,rplidar_case_z])
        translate([rplidar_case_x/2,rplidar_case_y/2,-(rplidar_case_z)/2])
        difference(){
            roundedBox([rplidar_case_x, rplidar_case_y, rplidar_case_z], 5, true, $fn=100);
            translate([0,0,-case_thickness])
            roundedBox([rplidar_x+rplidar_x_pad, rplidar_y+rplidar_y_pad,rplidar_case_z], 5, true, $fn=100);
        }
        
        color("blue")
        translate([76,19,rplidar_case_interior_z-6])
        cylinder(10, r= 5, center = false);
        
        color("green")
        translate([76,56,rplidar_case_interior_z-6])
        cylinder(10, r= 5, center = false);
        
        color("yellow")
        translate([98,35,rplidar_case_interior_z-33])
        cylinder(29, r= 6, center = false);
        
        color("purple")
        translate([7,6,rplidar_case_interior_z-20])
        cylinder(24, r= 6, center = false);
        
        color("black")
        translate([6,69,rplidar_case_interior_z-20])
        cylinder(24, r= 6, center = false);
        
        color("blue")
        translate([0,-3,2])
        screw_plate(7,3,2, $fn=100);
        
        color("red")
        translate([47.5,-3,2])
        screw_plate(7,3,2, $fn=100);
        
        color("grey")
        translate([-3,36,2])
        screw_plate(7,3,2, $fn=100);
        
         color("green")
        translate([95,-3,2])
        screw_plate(7,3,2, $fn=100);
        
        color("yellow")
        translate([0,72,2])
        screw_plate(7,3,2, $fn=100);
        
        color("orange")
        translate([47.5,72,2])
        screw_plate(7,3,2, $fn=100);
        
        color("black")
        translate([95,72,2])
        screw_plate(7,3,2, $fn=100);
        
        color("brown")
        translate([100,36,2])
        screw_plate(7,3,2, $fn=100);
    }
    
    translate([1,73,circuit_z+case_thickness])
    rotate([90,0,0])
    scale([ 1.02, 1.02, 1]) 
    import("rplidar.stl", convexity=5);
}

color("red")
translate([-1*rplidar_x_pad/2,-1*rplidar_y_pad/2,0])
translate([rplidar_case_x/2,rplidar_case_y/2,-(case_thickness)/2])
translate([0,rplidar_case_y+5,rplidar_case_z])
roundedBox([rplidar_x+rplidar_x_pad, rplidar_y+rplidar_y_pad,2], 5, true, $fn=100);