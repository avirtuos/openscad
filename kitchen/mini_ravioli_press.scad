use <MCAD/boxes.scad>

//Configs
dough_thickness=2;
press_height=25.4*.6;
//This is the overall size of the entire press for single ravioli
ravioli_size=25.4*1.375;
//size of the cutting ridge around the outside of each ravioli
ravioli_cut_size=1.2;
//size of the seem which closes the ravioli and holds them together
revioli_seem_size=(25.4*.16);
ravioli_seem_ridge_width=5.55625;
ravioli_seem_ridge_depth=2.4;
tab_size=1.5;
rows =6;
cols = 2;
revioli_stuffing_size=ravioli_size-(2*revioli_seem_size)-(2*ravioli_cut_size);
$fn=12;

parts=3;


if(parts == 2 || parts > 2){
    translate([0,0,5])
    union(){
        for (i = [0:rows]) {
            for(k = [0:(3*rows - 2)]){
                translate([-1,-1 + ((ravioli_size/3-.75)*(i+k)),press_height+1])
                #cube([ravioli_size*3,1,.5]);
            }
                    
            for(j = [0:13]){
                translate([-1 +(j*8),-1 + ((ravioli_size-.75)*i),press_height+1])
                #cube([1, ravioli_size,.5]);
            }
        }
        difference(){
           union(){
                for (i = [0:rows]) {
                    translate([-1,-1 + ((ravioli_size-.75)*i),press_height])
                    cube([ravioli_size*3,ravioli_size,1]);

                    translate([ravioli_size/2,(ravioli_size/2 ) + ((ravioli_size-1.199)*i), ravioli_size*.5]){
                        sphere(ravioli_size*.32);
                        translate([ravioli_size-ravioli_cut_size,0,0])
                        sphere(ravioli_size*.32);
                        translate([(ravioli_size-ravioli_cut_size)*2,0,0])
                        sphere(ravioli_size*.32);
                    }
                }
            }
            
               union(){
                for (i = [0:rows]) {
                    translate([0,ravioli_size*i,press_height+1])
                    cube([ravioli_size*3,ravioli_size,press_height*2]);
                    translate([ravioli_size/2,(ravioli_size/2 ) + ((ravioli_size-1.199)*i), ravioli_size*.5]){
                        sphere(ravioli_size*.30);
                        translate([ravioli_size-ravioli_cut_size,0,0])
                        sphere(ravioli_size*.30);
                        translate([(ravioli_size-ravioli_cut_size)*2,0,0])
                        sphere(ravioli_size*.30);
                    }
                }
            }
        }
    }
}

if(parts == 1 || parts > 2){
    difference(){
        union(){
            color("green"){
                //Connection Tab Male
                translate([ravioli_size-.5,0,(press_height*.5)/2])
                rotate([0,0,90])
                difference(){
                    linear_extrude(height = press_height*.5, center = true, convexity = 10, twist = 0)
                    circle(5,$fn=3);
                    translate([3,0,0])
                    linear_extrude(height = press_height+2, center = true, convexity = 10, twist = 0)
                    circle(5,$fn=3);
                }

                //Connection Tab Male
                translate([(ravioli_size*2)-1.75,0,(press_height*.5)/2])
                rotate([0,0,90])
                difference(){
                    linear_extrude(height = press_height*.5, center = true, convexity = 10, twist = 0)
                    circle(5,$fn=3);
                    translate([3,0,0])
                    linear_extrude(height = press_height+2, center = true, convexity = 10, twist = 0)
                    circle(5,$fn=3);
                }
            }
            
            for (i = [0:rows]) {
                translate([0,(ravioli_size-ravioli_cut_size)*i, 0]){
                    if(i == 0){
                        single_press(10,10);
                        translate([ravioli_size-ravioli_cut_size,0,0])
                        single_press(-1, 10);
                        translate([(ravioli_size-ravioli_cut_size)*2,0,0])
                        single_press(-10, 10);
                    } else if (i == rows){
                        single_press(10,-10);
                        translate([ravioli_size-ravioli_cut_size,0,0])
                        single_press(-1, -10);
                        translate([(ravioli_size-ravioli_cut_size)*2,0,0])
                        single_press(-10, -10);
                    } else {
                        single_press(10,-1);
                        translate([ravioli_size-ravioli_cut_size,0,0])
                        single_press(-1, -1);
                        translate([(ravioli_size-ravioli_cut_size)*2,0,0])
                        single_press(-10, -1);
                    }
                }
            }
        }
        
        color("red"){
            //Connection Tab Female
            translate([ravioli_size-.5,ravioli_size-.25 +((ravioli_size-1.199)*rows),.49+(press_height*.5)/2])
            rotate([0,0,90])
            #difference(){
                linear_extrude(height = (press_height*.5)+1, center = true, convexity = 10, twist = 0)
                circle(6,$fn=3);
                translate([3.5,0,0])
                linear_extrude(height = press_height+2, center = true, convexity = 10, twist = 0)
                circle(6,$fn=3);
            }
            
            //Connection Tab Female
            translate([(ravioli_size*2)-1.75,ravioli_size-.25 +((ravioli_size-1.199)*rows),.49+(press_height*.5)/2])
            rotate([0,0,90])
            #difference(){
                linear_extrude(height = (press_height*.5)+1, center = true, convexity = 10, twist = 0)
                circle(6,$fn=3);
                translate([3.5,0,0])
                linear_extrude(height = press_height+2, center = true, convexity = 10, twist = 0)
                circle(6,$fn=3);
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
}


    module single_press(x_shift=-1, y_shift=-1){
        difference(){
            union(){
                color("green")
                cube([ravioli_size,ravioli_size,press_height-dough_thickness/2]);
                color("blue")
                translate([0,0,press_height-(dough_thickness/2)]){
                cube([ravioli_size,ravioli_size,dough_thickness/2]);
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

            difference(){
                union(){
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
                }
                difference(){
                    cube([ravioli_size,ravioli_size,press_height-dough_thickness/2]);
                    trim=2.4;
                    translate([trim/2,trim/2,-1])
                    cube([ravioli_size-trim,ravioli_size-trim,press_height]);
                }
            }
            
         
            translate([ravioli_size*.5,ravioli_size/2,-2])
            scale([.95,1,1])
            rotate([90,0,0])
            linear_extrude(height = ravioli_size-5, center = true, convexity = 10, twist = 0)
            circle((ravioli_size*.7)*.5,$fn=6);
            
            translate([ravioli_size/2,ravioli_size*.5,-2])
            scale([1,1.2,1])
            rotate([90,0,90])
            linear_extrude(height = ravioli_size-5, center = true, convexity = 10, twist = 0)
            circle((ravioli_size*.7)*.5,$fn=6);
            
                /*
            color("blue")
            translate([2,24,4])
             rotate([0,90,0])
             roundedBox([12,35,100],  2, true, $fn=100);

            translate([24,25,4])
             rotate([0,90,90])
             roundedBox([12,35,100],  2, true, $fn=100);
             */
             
            translate([ravioli_cut_size,ravioli_cut_size,press_height-dough_thickness-.3])
            color("red")
            cube([ravioli_size-(2*ravioli_cut_size),ravioli_size-(2*ravioli_cut_size),dough_thickness+1]);
            
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
                               (ravioli_seem_ridge_width*i - 1),
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
