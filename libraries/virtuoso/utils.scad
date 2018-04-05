module screw_plate(screw_plate_size=7, screw_size=3, screw_plate_thickness=3, x,y){
    difference(){
        //base_screw_hole 
        cube([screw_plate_size, screw_plate_size , screw_plate_thickness]);
        translate([screw_plate_size/2, screw_plate_size/2, 0-1]){
            cylinder (h = screw_plate_thickness+2, r=screw_size/2);
        }
    } 
}

module screw_plate_hole(screw_plate_size=7, screw_size=3, screw_plate_thickness=3, x,y){translate([screw_plate_size/2, screw_plate_size/2, 0-1]){
        cylinder (h = screw_plate_thickness+2, r=screw_size/2);
    }
}