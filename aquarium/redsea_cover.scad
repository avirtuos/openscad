
tank_depth=25.75*25.4;
tank_width=71*25.4;
tank_height=23.75*25.4;
tank_wall_thickness=(0.75*25.4) +.2;
tank_bottom_thickness=0.75*25.4;

section_x=(17*25.4) + 3;
section_y=(12.875*25.4) + 3;
section_z=.50*25.4;

section_cutout_x=8*25.4;
section_cutout_y=5*25.4;
section_cutout_z=section_z+.2;


light_x=50*25.4;
light_y=4*25.4;
light_z=10*25.4;

overflow_x=10.5*25.4;
overflow_y=4*25.4;
overflow_z=tank_height;

// 0 - all
// 1 = left front (red)
// 2= left back (purple)

part=1;

if(part == 0){
    %union(){
        translate([tank_width/2 - light_x/2, tank_depth/2 - light_y/2,tank_height-.1])
        cube([light_x, light_y, light_z]);
        translate([tank_width/2 - overflow_x/2, tank_depth - overflow_y,.1])
        cube([overflow_x, overflow_y, overflow_z]);
        difference(){
            cube([tank_width,tank_depth, tank_height]);
            translate([tank_wall_thickness,tank_wall_thickness,tank_bottom_thickness])
            cube([tank_width-(2*tank_wall_thickness),tank_depth-(2*tank_wall_thickness), tank_height]);
        }
    }
}


if(part == 0 || part == 1){
    color("red"){
        difference(){
            translate([-3,-3,tank_height-(section_z*.75)]){
                difference(){
                    cube([section_x, section_y, section_z]);
                    color("blue")
                    translate([(1.25*25.4),(1.25*25.4),-.1]){
                        cube([section_x- (1.50*25.4), section_y- (1.50*25.4), .1 + section_z*.80]);
                    }
                }
            }

            translate([tank_width/2 - light_x/2, tank_depth/2 - light_y/2,tank_height-25])
            color("green")
            cube([light_x, light_y, light_z]);
            translate([tank_width/2 - overflow_x/2, tank_depth - overflow_y,.1])
            cube([overflow_x, overflow_y, overflow_z]);
            difference(){
                cube([tank_width,tank_depth, tank_height]);
                translate([tank_wall_thickness,tank_wall_thickness,tank_bottom_thickness])
                cube([tank_width-(2*tank_wall_thickness),tank_depth-(2*tank_wall_thickness), tank_height]);
            }
            
            translate([section_x/4, section_y/4,tank_height-.1])
            cube([section_cutout_x,section_cutout_y, section_cutout_z]);
            
        }
    }
}

if(part == 0 || part == 2){
    color("purple"){
        difference(){
            translate([-3,section_y-3,tank_height-(section_z*.75)]){
                difference(){
                    cube([section_x, section_y, section_z]);
                    color("blue")
                    translate([(1.25*25.4),+(.25*25.4),-.1]){
                        cube([section_x- (1.50*25.4), section_y- (1.50*25.4), .1 + section_z*.80]);
                    }
                }
            }

            translate([tank_width/2 - light_x/2, tank_depth/2 - light_y/2,tank_height-25])
            color("green")
            cube([light_x, light_y, light_z]);
            translate([tank_width/2 - overflow_x/2, tank_depth - overflow_y,.1])
            cube([overflow_x, overflow_y, overflow_z]);
            difference(){
                cube([tank_width,tank_depth, tank_height]);
                translate([tank_wall_thickness,tank_wall_thickness,tank_bottom_thickness])
                cube([tank_width-(2*tank_wall_thickness),tank_depth-(2*tank_wall_thickness), tank_height]);
            }
            
            translate([section_x/4, tank_depth - section_y/4 - section_cutout_y,tank_height-.1])
            cube([section_cutout_x,section_cutout_y, section_cutout_z]);
        }
    }
}