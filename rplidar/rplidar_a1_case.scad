use <MCAD/boxes.scad>
use <virtuoso/utils.scad>


rplidar_x = 100;
rplidar_y = 72;
rplidar_assembly_z=37;
circuit_z=0;


rplidar_x_pad=10;
rplidar_y_pad=10;
rplidar_assembly_z_pad=2;
case_thickness=1.2;
case_cover_pad=3;

rplidar_case_x=rplidar_x+rplidar_x_pad+(2*case_thickness);
rplidar_case_y=rplidar_y+rplidar_y_pad+(2*case_thickness);
rplidar_case_z=rplidar_assembly_z + rplidar_assembly_z_pad + circuit_z + (2 * case_thickness) + case_cover_pad;
rplidar_case_interior_z=rplidar_assembly_z + rplidar_assembly_z_pad + circuit_z + case_cover_pad;


difference(){
    
    union(){
        color("red")
        translate([-1*rplidar_x_pad/2,-1*rplidar_y_pad/2,rplidar_case_z])
        translate([rplidar_case_x/2,rplidar_case_y/2,-(rplidar_case_z)/2])
        difference(){
            roundedBox([rplidar_case_x, rplidar_case_y, rplidar_case_z], 5, true, $fn=100);
            translate([0,0,-case_thickness])
            roundedBox([rplidar_x+rplidar_x_pad, rplidar_y+rplidar_y_pad,rplidar_case_z], 5, true, $fn=100);
        
            translate([-1*rplidar_case_x/2-10,-1*rplidar_case_y/2+20,-rplidar_case_z/2])
            cube([20,4,case_cover_pad+4]);
        
            color("blue")
            for(vent = [0 : 1 : 12]){
                translate([-1*rplidar_case_x/2,-1*rplidar_case_y/2,-rplidar_case_z/2])
                translate([30 + (vent * 4) ,-5,15])
                cube([2,10, 25]);
                
                translate([-1*rplidar_case_x/2,-1*rplidar_case_y/2,-rplidar_case_z/2])
                translate([30 + (vent * 4) ,80,15])
                cube([2,10, 25]);
                
                translate([-1*rplidar_case_x/2,-1*rplidar_case_y/2,-rplidar_case_z/2])
                translate([-5, 18 + (vent * 4),15])
                cube([10,2, 25]);
                
                translate([-1*rplidar_case_x/2,-1*rplidar_case_y/2,-rplidar_case_z/2])
                translate([105, 18 + (vent * 4),15])
                cube([10,2, 25]);
             }
        }
        
        color("blue")
        translate([85,16,rplidar_case_interior_z-11])
        cylinder(13, r= 4, center = false);
        
        color("red")
        translate([85,60,rplidar_case_interior_z-11])
        cylinder(13, r= 4, center = false);
        
        color("yellow")
        translate([103,39,rplidar_case_interior_z-11])
        cylinder(13, r= 4, center = false);
        
        color("purple")
        translate([7,8,rplidar_case_interior_z-11])
        cylinder(13, r= 4, center = false);
        
        color("black")
        translate([7,68,rplidar_case_interior_z-11])
        cylinder(13, r= 4, center = false);
        
        color("blue")
        translate([7,3.2,case_thickness+case_cover_pad])
        screw_plate(7,3,7, supported=false, rotate_z=180, $fn=100);
        
        color("green")
        translate([54.5,3.2,case_thickness+case_cover_pad])
        screw_plate(7,3,7, supported=false, rotate_z=180, $fn=100);
        
        color("grey")
        translate([3,36,case_thickness+case_cover_pad])
        screw_plate(7,3,7, supported=false, rotate_z=90, $fn=100);
        
        color("green")
        translate([100,3.2,case_thickness+case_cover_pad])
        screw_plate(7,3,7, supported=false, rotate_z=180, $fn=100);
        
        color("yellow")
        translate([0,71.2,case_thickness+case_cover_pad])
        screw_plate(7,3,7, supported=false, rotate_z=0, $fn=100);
        
        color("orange")
        translate([47.5,71.2,case_thickness+case_cover_pad])
        screw_plate(7,3,7, supported=false, rotate_z=0, $fn=100);
        
        color("black")
        translate([95,71.2,case_thickness+case_cover_pad])
        screw_plate(7,3,7, supported=false, rotate_z=0, $fn=100);
        
        color("brown")
        translate([106.2,35,case_thickness+case_cover_pad])
        screw_plate(7,3,7, supported=false, rotate_z=90, $fn=100);
    }
    
    translate([1,73,circuit_z+case_thickness+case_cover_pad])
    rotate([90,0,0])
    scale([ 1.05, 1.05, .99]) 
    import("rplidar.stl", convexity=5);
}


translate([-1*rplidar_x_pad/2,-1*rplidar_y_pad/2,0])
translate([rplidar_case_x/2,rplidar_case_y/2,-(case_thickness)/2])
translate([0,rplidar_case_y+5,rplidar_case_z])
difference(){
    color("red")
    roundedBox([rplidar_x+rplidar_x_pad, rplidar_y+rplidar_y_pad,case_thickness], 5, true, $fn=100);
    
    color("Blue")
    mirror()
    translate([-(rplidar_case_x)/2 + 7,-(rplidar_case_y/2)+ 10,-3])
    linear_extrude(height = case_thickness+4)
    text("AnthonyVirtuoso.com - RPiLidar", font = "Times New Roman:style=Bold",size = 5);

    color("blue")
    for(vent = [0 : 1 : 16]){
        translate([-(rplidar_case_x)/2 + 5,-(rplidar_case_y/2)+ 10,-3])
        translate([18 + (vent * 4) ,15,0])
        cube([2,40, 10]);
    }
    
    translate([-(rplidar_x+rplidar_x_pad)/2,-(rplidar_y+rplidar_y_pad)/2,0]){
        color("blue")
        translate([3.8,0,-3])
        screw_plate_hole(7,3,7, $fn=100);
        
        color("red")
        translate([51.3,0,-3])
        screw_plate_hole(7,3,7, $fn=100);
        
        color("grey")
        translate([-.2,39.8,-3])
        screw_plate_hole(7,3,7, $fn=100);
        
        color("green")
        translate([96.8,0,-3])
        screw_plate_hole(7,3,7, $fn=100);
        
        color("yellow")
        translate([3.8,75,-3])
        screw_plate_hole(7,3,7, $fn=100);
        
        color("orange")
        translate([51.4,75,-3])
        screw_plate_hole(7,3,7, $fn=100);
        
        color("black")
        translate([98.8,75,-3])
        screw_plate_hole(7,3,7, $fn=100);
        
        color("brown")
        translate([103,38.8,-3])
        screw_plate_hole(7,3,7, $fn=100);
    }
}

