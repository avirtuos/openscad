

inner_thickness=3;
inner_overlap=40;
inner_x=25.4*6.5+(3*inner_thickness);
inner_y=25.4*7.5;
inner_z=25.4*8;
guard_z=25.4*2;





module hex(hole, wall, thick){
    hole = hole;
    wall = wall;
    difference(){
        rotate([0, 0, 30]) cylinder(d = (hole + wall), h = thick, $fn = 6);
        translate([0, 0, -0.1]) rotate([0, 0, 30]) cylinder(d = hole, h = thick + 0.2, $fn = 6);
    }
}



module hexgrid(box, holediameter, wallthickness) {
    a = (holediameter + (wallthickness/2))*sin(60);
    for(x = [holediameter/2: a: box[0]]) {
        for(y = [holediameter/2: 2*a*sin(60): box[1]]) {
            translate([x, y, 0]) hex(holediameter, wallthickness, box[2]);
            translate([x + a*cos(60), y + a*sin(60), 0]) hex(holediameter, wallthickness, box[2]);

        }
    }
        
}

// first arg is vector that defines the bounding box, length, width, height
// second arg in the 'diameter' of the holes. In OpenScad, this refers to the corner-to-corner diameter, not flat-to-flat
// this diameter is 2/sqrt(3) times larger than flat to flat
// third arg is wall thickness.  This also is measured that the corners, not the flats. 

difference(){
union(){
    translate([0,-5-inner_thickness/2,inner_z]){
        difference(){
            color("yellow")
            cube([inner_x,inner_y+15,inner_thickness]);
            translate([-30,3.5+inner_thickness/2,-1])
            cube([inner_x*2,inner_y-inner_thickness+2,inner_thickness+2]);
        }
    }
translate([0,9,12])
rotate([0,90,0])
cylinder(r1=5, r2=5, h=inner_x, $fn=100);
    
    
translate([0,5 + inner_x,12])
rotate([0,90,0])
cylinder(r1=5, r2=5, h=inner_x, $fn=100);
    


    translate([0,0,inner_z-3])
    rotate([20,0,0])
    color("orange")
    difference(){
        cube([inner_x,3*inner_thickness,guard_z]);
        translate([inner_thickness/2, inner_thickness/2,-.1]){
            cube([inner_x-inner_thickness,2*inner_thickness,guard_z+.2]);
        }
    }


    translate([0,inner_y-11.5,inner_z])
    rotate([-20,0,0])
    color("red")
    difference(){
        cube([inner_x,3*inner_thickness,guard_z]);
        translate([inner_thickness/2, inner_thickness/2,-.1]){
            cube([inner_x-inner_thickness,2*inner_thickness,guard_z+.2]);
        }
    }
    
    //Sleds
    translate([0,7,inner_z])
    rotate([-20,0,0])
    cube([inner_x,inner_y/4,inner_thickness]);

    translate([0,inner_y*.71,inner_z-16])
    rotate([20,0,0])
    cube([inner_x,inner_y/4,inner_thickness]);


    translate([0,30,inner_z-3])
    rotate([0,20,0])
    cube([inner_x/4,inner_y-60,inner_thickness]);
        
//Side 1
rotate([90,0,0]){
    union(){
        translate([2,1.5,0]){
            color("red")
            hexgrid([inner_x-12, inner_z-12, inner_thickness], 10, inner_thickness);
        }
        color("green")
        difference(){
            cube([inner_x,inner_z,inner_thickness]);
            translate([inner_overlap/2,inner_overlap/2,-1])
            cube([inner_x-inner_overlap,inner_z-inner_overlap, inner_thickness+2]);
        }
    }
}

//Side 2
translate([0,inner_y,0])
rotate([90,0,0]){
    union(){
        translate([2,1.5,0]){
            color("red")
            hexgrid([inner_x-12, inner_z-12, inner_thickness], 10, inner_thickness);
        }
        color("green")
        difference(){
            cube([inner_x,inner_z,inner_thickness]);
            translate([inner_overlap/2,inner_overlap/2,-1])
            cube([inner_x-inner_overlap,inner_z-inner_overlap, inner_thickness+2]);
        }
    }
}

//Bottom
    union(){
        translate([8,0,0]){
            color("red")
            hexgrid([inner_x-20, inner_y-20, inner_thickness], 10, inner_thickness);
        }
        color("green")
        difference(){
            cube([inner_x,inner_y,inner_thickness]);
            translate([inner_overlap/2,inner_overlap/2,-1])
            cube([inner_x-inner_overlap,inner_y-inner_overlap, inner_thickness+2]);
        }
    }

//left side
color("purple")
cube([inner_thickness, inner_y, inner_z]);
    
//right side
//color("blue")
//translate([inner_x-inner_thickness,0])
//cube([inner_thickness, inner_y, inner_z]);
}

//translate([inner_x/2,-100,-10])
//cube([inner_x, inner_y+200, inner_z+200]);
}
