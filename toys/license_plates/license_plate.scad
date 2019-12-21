
plate_y=10;
plate_x=plate_y *4;
plate_z=1;
plate_frame=1.6;
plate_text_z=1;

union(){
    color("black")
    cube([plate_x, plate_y, plate_z]);
    translate([0,0,plate_z-.01])
    color("white")
    difference(){
        cube([plate_x, plate_y, plate_text_z]);
        translate([plate_frame/2,plate_frame/2,-.5])
        cube([plate_x-plate_frame, plate_y-plate_frame, plate_text_z+2]);
    }

    color("white")
    translate([plate_x*.05,plate_y*.165,plate_z])
    linear_extrude(height = plate_text_z) {
        text("MARCO", size = 7, font = "Arial Bold:style=Bold");
    }
}