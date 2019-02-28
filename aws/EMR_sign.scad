use <MCAD/boxes.scad>

overall_z=37;
overall_x=190;
overall_y=190;
node_x=90;
node_y=90;
node_z=overall_z;

overall_thickness=5;
emr_text_z=10;
emr_text_size=50;


module emr_text(){
     //EMR Lettering w/Insert
    union(){
        color("blue")
        linear_extrude(height = emr_text_z)
        text("EMR",  font = "Liberation Sans:style=Bold", size=emr_text_size);
     
     
        color("red")
        translate([7,15,-4]){
            cube([5,20,5]);
        }
        
        color("red")
        translate([52,15,-4]){
            cube([5,20,5]);
        }
        
        color("red")
        translate([91.5,15,-4]){
            cube([5,20,5]);
        }
        
        color("red")
        translate([109,15,-4]){
            cube([5,20,5]);
        }
    }
}

module node_shell_joiner_female(z=10, thickness=3){
    translate([thickness+1,thickness+1,0]) {
        difference(){
            cylinder (h = z-1, r=thickness, $fn=100);
            cylinder (h = z/4, r=thickness/2, $fn=100);
        }
    }
}

module node_shell_joiner_male(z=10, thickness=3){
    translate([thickness+1,thickness+1,0]) {
        union(){
            cylinder (h = z-1, r=thickness, $fn=100);
            translate([0,0,-z/6]) {
                cylinder (h = z/2, r=thickness/2 - .5, $fn=100);
            }
        }
    }
}


module node_shell(x=10,y=10,z=10,thickness=2){
    union(){
        difference(){
            translate([x/2,y/2,z/2])
            roundedBox([x, y, z],  thickness*2, true, $fn=100);
            translate([x/2,y/2,z/2-thickness])
            roundedBox([x-thickness, y-thickness*2,  z],  thickness, true, $fn=100);
        }
        
        translate([1,y-thickness*3,0])
        node_shell_joiner_male(z, thickness);
        
        translate([x-thickness*3,y-thickness*2.5,0])
        node_shell_joiner_male(z, thickness);
        
        translate([2,1,0])
        node_shell_joiner_female(z, thickness);
        
        translate([x-thickness*3,0,0])
        node_shell_joiner_female(z, thickness);
    }
}

translate([245,245,0])
node_shell(x=node_x, y=node_y, z=overall_z/2, thickness=overall_thickness);


translate([395,135,0])
node_shell(x=node_x, y=node_y, z=overall_z/2, thickness=overall_thickness);

translate([395,-40,0])
node_shell(x=node_x, y=node_y, z=overall_z/2, thickness=overall_thickness);


translate([245,-150,0])
node_shell(x=node_x, y=node_y, z=overall_z/2, thickness=overall_thickness);


difference(){
    node_shell(x=overall_x, y=overall_y, z=overall_z/2, thickness=overall_thickness);
    translate([overall_x/2 - emr_text_size - 25,overall_y/2- emr_text_size/3,overall_z/2+.5]) 
    emr_text();
}


/*
translate([0,0,100])
difference(){
    translate([overall_x, overall_y]){
        rotate([0,0,180]){
            node_shell(x=overall_x, y=overall_y, z=overall_z/2, thickness=overall_thickness);
        }
    }
    translate([overall_x/2 - emr_text_size - 25,overall_y/2- emr_text_size/3,overall_z/2+.5]) 
    emr_text();
}

*/






//------------parameters---------------------------
// overall size of X dimension
gridX=800;  
// overall size of Y dimension
gridY=800;  
// X border size
borderX=0;  
// Y border size
borderY=0;  
// width of solid part of grid
meshSolid=0.5;
// width of blank part of grid 
meshSpace=10;  
// thickness in Z direction
thickness=1.5;  

//-------------------------------------------------
meshX=gridX-(borderX*2);
meshY=gridY-(borderY*2);
nX=meshX/(meshSolid+meshSpace);
nY=meshY/(meshSolid+meshSpace);

translate([300,250,0]){
difference() {
cube (size=[gridX,gridY,thickness],center=true);
cube (size=[meshX,meshY,thickness],center=true);
}

for (i=[0:nX]) {
	 	 translate([-(meshX/2)+i*(meshSolid+meshSpace),-meshY/2,-thickness/2]) cube(size=[meshSolid,meshY,thickness],center=false);
}

for (i=[0:nY]) {
	 	translate([-meshX/2,-(meshY/2)+i*(meshSolid+meshSpace),-thickness/2]) cube(size=[meshX,meshSolid,thickness],center=false);

}
}