

overall_width=8.5*25.4;
overall_height=13*25.4;
overall_length=17*25.4;

lid();

//bottom
//frame(x=overall_length, y=overall_width);

//sides x2
//translate([0,overall_width,0])
//rotate([90,0,0])
//frame(x=overall_length, y=overall_height);
//rotate([90,0,0])
//frame(x=overall_length, y=overall_height);

/*
//sides narrow x2
rotate([90,0,90])
frame(x=overall_width, y=overall_height);
translate([overall_length-3,0,0])
rotate([90,0,90])
frame(x=overall_width, y=overall_height);
*/

module frame(num_slots=6, thickness = 2, layers=2, spacing = 5, rim = 4, x = 0, y = 0){
    difference(){
    cube([x,y,layers]);
        num_rows = floor((y-(rim*3))/(spacing+thickness));
        for(i = [0:num_rows]){
            for(j=[0:num_slots]){
                grid_length = (x - (2*rim) ) / (num_slots+1) ;
                translate([rim+(j*(grid_length)),
                (i*(spacing+thickness))+(rim),-.2])
                cube([grid_length-thickness,spacing,layers+.4]);
            }
        }
    }
}

module lid(){
    difference(){
        union(){
            cube([overall_length,overall_width, 7]);
            translate([10,10,7.1])
            color("red")
            cube([overall_length-20,overall_width-20, 4*25.4]);
        }

            translate([17,17,12.7])
            color("blue")
            cube([overall_length-34,overall_width-34, 4*25.4]);
    }
}

/*
difference(){
    cube([length,width, height]);
    translate([spacing,spacing,spacing])
    cube([length-(2*spacing),width-(2*spacing), height]);
    
    
color("red")
for(i = [0:25]){
    for(j=[0:6]){
        translate([8+(j*(grid_length*25.4+5)),i*(spacing+5)+5,-.2])
        cube([grid_length*25.4,spacing,spacing+.4]);
    }
}


color("green")
for(i = [0:3]){
    for(j=[0:45]){
        translate([-.1, i*(grid_length*25.4+5)+20,8+(j*(spacing+5))])
        cube([spacing+.2,grid_length*25.4, spacing]);
    }
}

color("cyan")
for(i = [0:3]){
    for(j=[0:45]){
        translate([length+-.1-spacing, i*(grid_length*25.4+5)+20,8+(j*(spacing+5))])
        cube([spacing+.2,grid_length*25.4, spacing]);
    }
}


color("purple")
for(i = [0:6]){
    for(j=[0:45]){
        
        translate([i*(grid_length*25.4+5)+10,-.1,8+(j*(spacing+5))])
        cube([grid_length*25.4,spacing+.2,spacing]);
    }
}

color("blue")
for(i = [0:6]){
    for(j=[0:45]){
        translate([i*(grid_length*25.4+5)+10,-.1+width-spacing,8+(j*(spacing+5))])
        cube([grid_length*25.4,spacing+.2,spacing]);
    }
}

}
*/





