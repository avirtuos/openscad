use <MCAD/boxes.scad>

//Configs
dough_thickness=2;
press_height=25.4*.6;
//This is the overall size of the entire press for single ravioli
ravioli_size=25.4*1.875;
//size of the cutting ridge around the outside of each ravioli
ravioli_cut_size=1.2;
//size of the seem which closes the ravioli and holds them together
revioli_seem_size=(25.4*.20);
ravioli_seem_ridge_width=5.55625;
ravioli_seem_ridge_depth=2.4;
tab_size=1.5;
rows = 4;
revioli_stuffing_size=ravioli_size-(2*revioli_seem_size)-(2*ravioli_cut_size);
$fn=100;

magnet_r=5.1;
magnet_d=3.3;


difference(){
    union(){
        for (i = [0:rows]) {
            translate([0,(ravioli_size-ravioli_cut_size)*i, 0]){
                if(i == 0){
                    single_press(10,10);
                    translate([ravioli_size-ravioli_cut_size,0,0])
                    single_press(-10, 10);
                } else if (i == rows){
                    single_press(10,-10);
                    translate([ravioli_size-ravioli_cut_size,0,0])
                    single_press(-10, -10);
                } else {
                    single_press(10,-1);
                    translate([ravioli_size-ravioli_cut_size,0,0])
                    single_press(-10, -1);
                }
            }
        }
    }
    
    translate([magnet_r*1.35,magnet_d-.1,press_height-(magnet_r*1.8)])
    rotate([90,0,0])
    cylinder(r1=magnet_r,r2=magnet_r,h=magnet_d);

    translate([ravioli_size-magnet_r*1.35,magnet_d-.1,press_height-(magnet_r*1.8)])
    rotate([90,0,0])
    cylinder(r1=magnet_r,r2=magnet_r,h=magnet_d);

    translate([ravioli_size+magnet_r*1.1,magnet_d-.1,press_height-(magnet_r*1.8)])
    rotate([90,0,0])
    cylinder(r1=magnet_r,r2=magnet_r,h=magnet_d);

    translate([(ravioli_size*2)-magnet_r*1.6,magnet_d-.1,press_height-(magnet_r*1.8)])
    rotate([90,0,0])
    cylinder(r1=magnet_r,r2=magnet_r,h=magnet_d);
    
    
    magnet_y_offset=((rows+1)*(ravioli_size+.1)) -(rows*1.3);
    translate([magnet_r*1.35,magnet_y_offset,press_height-(magnet_r*1.8)])
    rotate([90,0,0])
    cylinder(r1=magnet_r,r2=magnet_r,h=magnet_d);

    translate([ravioli_size-magnet_r*1.35,magnet_y_offset,press_height-(magnet_r*1.8)])
    rotate([90,0,0])
    cylinder(r1=magnet_r,r2=magnet_r,h=magnet_d);

    translate([ravioli_size+magnet_r*1.1,magnet_y_offset,press_height-(magnet_r*1.8)])
    rotate([90,0,0])
    cylinder(r1=magnet_r,r2=magnet_r,h=magnet_d);

    translate([(ravioli_size*2)-magnet_r*1.6,magnet_y_offset,press_height-(magnet_r*1.8)])
    rotate([90,0,0])
    cylinder(r1=magnet_r,r2=magnet_r,h=magnet_d);
}

module single_press(x_shift=-1, y_shift=-1){
    difference(){
        union(){
            color("green")
            cube([ravioli_size,ravioli_size,press_height-dough_thickness/2]);
            color("white")
            translate([ravioli_cut_size*.25,ravioli_cut_size*.25,press_height-(dough_thickness/2)]){
            difference(){
                cube([ravioli_size-(ravioli_cut_size*.6),ravioli_size-(ravioli_cut_size*.6),dough_thickness/2]);
                translate([ravioli_cut_size*.4,ravioli_cut_size*.4,-1])
                    color("red")
                    cube([ravioli_size-(ravioli_cut_size*1.4),ravioli_size-(ravioli_cut_size*1.4),3]);
                }
            }
        }
        
        if (tab_size > 0 ){
            translate([ravioli_cut_size*.25,ravioli_cut_size*.25,press_height-(dough_thickness/2)]){
                    translate([ravioli_size*.25-(tab_size*.5),y_shift,-tab_size*.33])
                    cube([tab_size*2,ravioli_size+2,tab_size]);
                    
                    translate([ravioli_size*.75-(tab_size*.5),y_shift,-tab_size*.33])
                    cube([tab_size*2,ravioli_size+2,tab_size]);
                    
                    translate([x_shift, ravioli_size*.25-(tab_size*.5),-(tab_size*.33)])
                    cube([ravioli_size+2,tab_size*2,tab_size]);
                    
                    translate([x_shift, ravioli_size*.75-(tab_size*.5),-(tab_size*.33)])
                    cube([ravioli_size+2,tab_size*2,tab_size]);
            }
        }
        translate([ravioli_cut_size,ravioli_cut_size,press_height-dough_thickness])
        color("red")
        cube([ravioli_size-(2*ravioli_cut_size),ravioli_size-(2*ravioli_cut_size),dough_thickness+1]);
        
        color("blue")
        translate([revioli_stuffing_size/2 +(ravioli_size-revioli_stuffing_size)/2,
        revioli_stuffing_size/2 +(ravioli_size-revioli_stuffing_size)/2,
        press_height*.7])
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
        
            
            
        translate([ravioli_size/6,ravioli_size/2,-press_height*.55])
        difference(){
            color("red")
            scale([1, .75, 1])
            sphere(ravioli_size*.38); 
            //translate([0,-ravioli_size/2,-ravioli_size/2])
            //cube([ravioli_size,ravioli_size,ravioli_size]);
        }
        
        rotate([0,180,0])
        translate([-ravioli_size*5/6,ravioli_size/2,press_height*.55])
        difference(){
            color("red")
            scale([1, .75, 1])
            sphere(ravioli_size*.38); 
            //translate([0,-ravioli_size/2,-ravioli_size/2])
            //cube([ravioli_size,ravioli_size,ravioli_size]);
        }
        
        rotate([0,180,90])
        translate([-ravioli_size*5/6,-ravioli_size/2,press_height*.55])
        difference(){
            color("red")
            scale([1, .75, 1])
            sphere(ravioli_size*.38); 
            //translate([0,-ravioli_size/2,-ravioli_size/2])
            //cube([ravioli_size,ravioli_size,ravioli_size]);
        }
        
        rotate([0,0,90])
        translate([ravioli_size/6,-ravioli_size/2,-press_height*.55])
        difference(){
            color("red")
            scale([1, .75, 1])
            sphere(ravioli_size*.38); 
            //translate([0,-ravioli_size/2,-ravioli_size/2])
            //cube([ravioli_size,ravioli_size,ravioli_size]);
        }
        
            /*
        color("blue")
        translate([2,24,4])
         rotate([0,90,0])
         roundedBox([12,35,100],  2, true, $fn=100);

        translate([24,25,4])
         rotate([0,90,90])
         roundedBox([12,35,100],  2, true, $fn=100);
         */
    }
}


module seem_row(rotation, length=ravioli_size){
count =  (length-1)/ravioli_seem_ridge_width;
    for (i = [1:count]) {
        color("purple")
        seem_ridge(width=ravioli_seem_ridge_width,
                depth=ravioli_seem_ridge_depth,
                length = (ravioli_seem_ridge_width * 1.4),
                position= [0,
                           (ravioli_seem_ridge_width*i),
                           press_height-dough_thickness+.1],
                rotation=rotation
        );
    }
}

module seem_ridge(width, depth, length, position, rotation){
    translate([position[0], position[1]+1, position[2]]){
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