
cube_x=25.4*17;
cube_y=25.4*8.5;
cube_z=5;

outline_size=25.4 *1;


module sign(cube_x,cube_y, cube_r, cube_z, diff=0){
    cylinder_r=cube_r;
    cube([cube_x, cube_y, cube_z]);
    translate([cube_x/2, diff + cube_y/3, 0])
    difference(){
        cylinder(r1=cylinder_r, r2=cylinder_r, h=cube_z, $fn=100);
        translate([-cylinder_r,-cylinder_r, -1])
        cube([2*cylinder_r, cylinder_r,cube_z+2]);
    }
}

    /*
sign(cube_x, cube_y, cube_z);

  */



difference(){
color("black")
sign(cube_x, cube_y, (cube_x)/2, cube_z);
    
    
    union(){
        
        translate([(outline_size-2)/2,(outline_size-2)/2,-.1]){
            difference(){
                color("white")
                sign(cube_x-outline_size-2, cube_y-outline_size-2, (cube_x-outline_size)/2, cube_z+.2, diff=-5);

                translate([outline_size/2,outline_size/2,-.1]){
                    color("blue")
                    sign(cube_x-(2*outline_size), cube_y-(2*outline_size), (cube_x-(2*outline_size))/2, cube_z+.4, diff=-10);
                }
            }
        }


        color("white")
        translate([cube_x*.4,cube_y*.83,-.1])
        linear_extrude(height = 5.2) {
            text("19", size = 59, font = "Times New Roman:style=Bold");
        }

        color("white")
        translate([cube_x*.12,cube_y*.35,-.1])
        linear_extrude(height = 5.2) {
            text("Virtuoso", size = 64, font = "Times New Roman:style=Bold");
        }

}
    
}


translate([outline_size/2,outline_size/2,cube_z]){
    difference(){
        color("white")
        sign(cube_x-outline_size, cube_y-outline_size, (cube_x-outline_size)/2, 1, diff=-5);

        translate([outline_size/2,outline_size/2,-.1]){
            color("blue")
            sign(cube_x-(2*outline_size), cube_y-(2*outline_size), (cube_x-(2*outline_size))/2, cube_z+.2, diff=-10);
        }
    }
}


color("white")
translate([cube_x*.4,cube_y*.83,1])
linear_extrude(height = 5) {
    text("19", size = 60, font = "Times New Roman:style=Bold");
}

color("white")
translate([cube_x*.12,cube_y*.35,1])
linear_extrude(height = 5) {
    text("Virtuoso", size = 65, font = "Times New Roman:style=Bold");
}








