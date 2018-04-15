module screw_plate(screw_plate_size=7, screw_size=3, screw_plate_thickness=3, supported=true, rotate_z=0){
  rotate([0, 0, rotate_z]){
    if(supported){
        difference(){
            //base_screw_hole
            cube([screw_plate_size, screw_plate_size , screw_plate_thickness]);
            translate([screw_plate_size/2, screw_plate_size/2, 0-1]){
                cylinder (h = screw_plate_thickness+2, r=screw_size/2);
            }
        }
    } else {
      difference(){
        polyhedron(
                points=[
                        [0,0,0],
                        [screw_plate_size,0,0],
                        [screw_plate_size, screw_plate_size, 0],
                        [0, screw_plate_size, 0],
                        [0, screw_plate_size, screw_plate_thickness],
                        [screw_plate_size, screw_plate_size, screw_plate_thickness]
                      ],
                faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
                );
        translate([screw_plate_size/2, screw_plate_size/2, 0-1]){
          cylinder (h = screw_plate_thickness+2, r=screw_size/2);
        }
      }

    }
  }
}

module screw_plate_hole(screw_plate_size=7, screw_size=3, screw_plate_thickness=3){
    translate([screw_plate_size/2, screw_plate_size/2, 0-1]){
        cylinder (h = screw_plate_thickness+2, r=screw_size/2);
    }
}
