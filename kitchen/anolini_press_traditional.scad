use <MCAD/boxes.scad>

anolini_radius=22.90/2;
anolini_outter_radius=26.42/2;
press_height=25.4*.5;
press_size=anolini_radius*2*1.5;
press_cut_depth=2;
rows=6;
cols=2;
$fn=50;

magnet_r=3.2;
magnet_d=3.2;

moldSpacing = press_size-1;
//1 for press only, 2 for mold only, 3+ for both
parts=3;


if(parts == 2 || parts > 2){
    translate([0,0,25])
    difference(){
       union(){
            for (i = [0:rows]) {
                translate([-1,-1 + (press_size*i),press_height])
                color("green")
                cube([press_size*3,press_size+2,1]);
                translate([press_size/2,(press_size/2 ) + (moldSpacing*i), press_size*.5]){
                    sphereSize = press_size* .32;
                    scale([1,1,1.35])
                    sphere(sphereSize);
                    translate([moldSpacing,0,0])
                    scale([1,1,1.35])
                    sphere(sphereSize);
                    translate([(moldSpacing)*2,0,0])
                    scale([1,1,1.35])
                    sphere(sphereSize);
                }
            }
        }
        
           union(){
            for (i = [0:rows]) {
                translate([0,press_size*i,press_height+1])
                cube([press_size*3,press_size,press_height*2]);
                translate([press_size/2,(press_size/2 ) + (moldSpacing*i), press_size*.5]){
                    sphereSize = press_size* .30;
                    scale([1,1,1.35])
                    sphere(sphereSize);
                    translate([moldSpacing,0,0])
                    scale([1,1,1.35])
                    sphere(sphereSize);
                    translate([(moldSpacing)*2,0,0])
                    scale([1,1,1.35])
                    sphere(sphereSize);
                }
            }
        }
    }
}

if(parts == 1 || parts > 2){

difference(){
union(){
    for (i = [0:rows]) {
        translate([0,(press_size-1)*i, 0]){
            for (i = [0:cols]) {
                translate([i*(press_size-1),0,0])
                single_press();
            }
        }
    }
}


        for(i =[0:cols]){
            offset = press_size-1;
            color("red"){
            translate([(offset*i)+magnet_r+1.5,magnet_d-.1,press_height-(magnet_r*1.5)])
            rotate([90,0,0])
            cylinder(r1=magnet_r,r2=magnet_r,h=magnet_d);

            translate([(offset*(i+1))-magnet_r-.5,magnet_d-.1,press_height-(magnet_r*1.5)])
            rotate([90,0,0])
            cylinder(r1=magnet_r,r2=magnet_r,h=magnet_d);
            }
            
                    color("blue"){
            magnet_y_offset=((rows+1)*(press_size+.1)) -(rows*1.1);
            translate([(offset*i)+magnet_r+1.5,magnet_y_offset,press_height-(magnet_r*1.5)])
            rotate([90,0,2])
            cylinder(r1=magnet_r,r2=magnet_r,h=magnet_d);

            translate([(offset*(i+1))-magnet_r-.5,magnet_y_offset,press_height-(magnet_r*1.5)])
            rotate([90,0,0])
            cylinder(r1=magnet_r,r2=magnet_r,h=magnet_d);
                    }
        }
    }
}

module single_press(){
    difference(){
        union(){
            translate([press_size/2,press_size/2,press_height]){
                    color("yellow")
                        difference(){
                        cylinder(h = press_cut_depth, 
                        r1 = anolini_outter_radius+1, 
                        r2 = anolini_outter_radius+1, center = false);
                        
                        translate([0,0,press_cut_depth-.4])
                        cylinder(h = .6, 
                        r1 = anolini_outter_radius+.2, 
                        r2 = anolini_outter_radius+.2, center = false);
                            
                        translate([0,0,-1])
                        cylinder(h = press_cut_depth+2, 
                        r1 = anolini_radius, 
                        r2 = anolini_outter_radius, center = false);
                    }
                }

            difference(){
                cube([press_size,press_size,press_height]);
                
                translate([anolini_radius*1.5,-1,-2])
                scale([1.05,1,1])
                rotate([100,0,])
                linear_extrude(height = 20, center = true, convexity = 15, twist = 0)
                circle((anolini_radius*2)*.5,$fn=6);
                    
                translate([anolini_radius*1.5,anolini_radius*3,-2])
                scale([1.05,1,1])
                rotate([80,0,])
                linear_extrude(height = 20, center = true, convexity = 15, twist = 0)
                circle((anolini_radius*2)*.5,$fn=6);
                
                translate([-1, anolini_radius*1.5,-2])
                scale([1.05,1.2,1])
                rotate([80,0,90])
                linear_extrude(height = 20, center = true, convexity = 15, twist = 0)
                circle((anolini_radius*2)*.5,$fn=6);
                    
                translate([anolini_radius*3, anolini_radius*1.5,-2])
                scale([1.05,1.2,1])
                rotate([100,0,90])
                linear_extrude(height = 20, center = true, convexity = 15, twist = 0)
                circle((anolini_radius*2)*.5,$fn=6);
                
            }
        }
    
            translate([press_size/2,press_size/2,-1])
            color("red")
            cylinder(h = press_height+1.1, 
            r1 = anolini_radius+5, 
            r2 = anolini_radius+.2, center = false);
    }
}