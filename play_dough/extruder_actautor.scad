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

//Press Linear Actuator
union(){
    translate([0, 0, 0])
    cylinder(r=chamber_inner_r-.4, h=press_plate_h, $fn=100);
    translate([0, 0, 25])
    nut("M20", thread="modeled", $fn=60);
}

rotate([0, 180, 0])
translate([80,50, -20])  
screw("M20x150x0", thread="modeled", $fn=60);

