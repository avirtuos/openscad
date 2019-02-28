use <MCAD/boxes.scad>

//Configs
dough_thickness=2;
press_height=25.4*.75;
//This is the overall size of the entire press for single ravioli
ravioli_size=25.4*1.875;
//size of the cutting ridge around the outside of each ravioli
ravioli_cut_size=1.2;
//size of the seem which closes the ravioli and holds them together
revioli_seem_size=(25.4*.25);
ravioli_seem_ridge_width=5.55625;
ravioli_seem_ridge_depth=2.4;

revioli_stuffing_size=ravioli_size-(2*revioli_seem_size)-(2*ravioli_cut_size);

union(){
    for (i = [0:3]) {
        translate([0,(ravioli_size-ravioli_cut_size)*i, 0]){
            single_press();
            translate([ravioli_size-ravioli_cut_size,0,0])
            single_press();
        }
    }
}

module single_press(){
    difference(){
        union(){
            color("green")
            cube([ravioli_size,ravioli_size,press_height-dough_thickness/2]);
            color("white")
            translate([ravioli_cut_size/3,ravioli_cut_size/3,press_height-(dough_thickness/2)]){
                difference(){
                    cube([ravioli_size-(ravioli_cut_size*2/3),ravioli_size-(ravioli_cut_size*2/3),dough_thickness/2]);
                    translate([ravioli_cut_size*1/3,ravioli_cut_size*1/3,-1])
                        color("red")
                    cube([ravioli_size-(ravioli_cut_size*4/3),ravioli_size-(ravioli_cut_size*4/3),3]);
                }
            }
        }
        translate([ravioli_cut_size,ravioli_cut_size,press_height-dough_thickness])
        color("red")
        cube([ravioli_size-(2*ravioli_cut_size),ravioli_size-(2*ravioli_cut_size),dough_thickness+1]);
        
        color("blue")
        translate([revioli_stuffing_size/2 +(ravioli_size-revioli_stuffing_size)/2,revioli_stuffing_size/2 +(ravioli_size-revioli_stuffing_size)/2,(revioli_stuffing_size/2)-(press_height/2)])
        roundedBox([revioli_stuffing_size, revioli_stuffing_size, press_height*2],  5, true, $fn=100);

        //origin ridges
        translate([ravioli_cut_size,ravioli_cut_size+.4,0])
        seem_row([-90,0,-90]);
        
        //x-right ridges
        translate([ravioli_size-ravioli_seem_ridge_width-(2*ravioli_cut_size)-1.2,
        ravioli_cut_size+.4,0])
        seem_row([-90,0,-90]);
        
        translate([ravioli_size,ravioli_cut_size,0])
        rotate([0,0,90])
        seem_row([-90,0,-90]);
        
        
        translate([ravioli_size,ravioli_size-(ravioli_seem_ridge_width*1.4)-ravioli_cut_size,0])
        rotate([0,0,90])
        seem_row([-90,0,-90]);
        
            
        color("blue")
        translate([2,24,4])
         rotate([0,90,0])
         roundedBox([12,35,100],  2, true, $fn=100);

        translate([24,25,4])
         rotate([0,90,90])
         roundedBox([12,35,100],  2, true, $fn=100);
    }
}


module seem_row(rotation, length=ravioli_size){
count =  length/ravioli_seem_ridge_width;
    for (i = [1:count]) {
        color("purple")
        seem_ridge(width=ravioli_seem_ridge_width,
                depth=ravioli_seem_ridge_depth,
                length = ravioli_seem_ridge_width * 1.4,
                position= [0,
                           (ravioli_seem_ridge_width*i),
                           press_height-dough_thickness+.1],
                rotation=rotation
        );
    }
}

module seem_ridge(width, depth, length, position, rotation){
    translate([position[0], position[1], position[2]]){
        triangle_points =[[0,0],[width/2,depth],[width,0]];
        rotate(rotation){
            linear_extrude(height = length)
            polygon(triangle_points,[],10);
        }
    }
}


/*
translate([ravioli_cut_size,ravioli_cut_size,0]){

    
    color("blue")
    cube([ravioli_size,ravioli_size,press_height]);


    color("blue")
    translate([revioli_seem_size/2,revioli_seem_size/2,-press_height/2])
    cube([revioli_stuffing_size,revioli_stuffing_size,press_height*2]);
    }
}
*/