use <nutsnbolts/cyl_head_bolt.scad>;
use <nutsnbolts/materials.scad>;

chamber_r=50.8;
chamber_h=76.2;
chamber_inner_r=chamber_r-3;
chamber_thread_r=4;
chamber_thread_h=20;

press_support_x=chamber_r;
press_support_y=(2*chamber_r)+10;
press_support_z=5;

press_plate_h=10;

rotate([0, 90, 0])
union(){
    translate([0,0,chamber_h - chamber_thread_h])
    difference(){
        thread(chamber_r+chamber_thread_r, chamber_thread_h, 6);
        translate([0, 0, -1])
        cylinder(r=chamber_r, h=chamber_thread_h+2, $fn=100);
    } 

    difference(){
        cylinder(r=chamber_r, h=chamber_h, $fn=100);
        translate([0, 0, -1])
        cylinder(r=chamber_inner_r, h=chamber_h+2, $fn=100);
    } 

    //Press Support
    difference(){
          
        intersection(){
            cylinder(r=chamber_r, h=chamber_h, $fn=100);
            translate([-press_support_x/2, -press_support_y/2, 0])
            cube([press_support_x,press_support_y,press_support_z]);
        }
        
        translate([0, 0, -20])
        cylinder(r=10, h=40, $fn=100);
    }

    color("blue")
    translate([0, 0, 10])
    nut("M20", thread="modeled", $fn=60);
}

/*
//Press Linear Actuator
union(){
    translate([0, 125, 0])
    cylinder(r=chamber_inner_r, h=press_plate_h, $fn=100);
    translate([0, 125, 25])
    nut("M20", thread="modeled", $fn=60);
}

translate([100,50, 150])  screw("M20x150x0", thread="modeled", $fn=60);
*/
