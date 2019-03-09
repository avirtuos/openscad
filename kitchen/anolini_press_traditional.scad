use <MCAD/boxes.scad>

anolini_radius=22.90/2;
anolini_outter_radius=26.42/2;
press_height=25.4*.5;
press_size=anolini_radius*2*1.45;
press_cut_depth=2;
$fn=100;

 
union(){
    for (i = [0:6]) {
        translate([0,(press_size-1)*i, 0]){
            for (i = [0:2]) {
                translate([i*(press_size-1),0,0])
                single_press();
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
                
                translate([press_size/4,press_size/2,-press_height*.13])
                difference(){
                    color("red")
                    sphere(press_size*.4, $fn=100); 
                    translate([0,-press_size/2,-press_size/2])
                    cube([press_size,press_size,press_size]);
                }
                
                rotate([0,180,0])
                translate([-press_size*3/4,press_size/2,press_height*.13])
                difference(){
                    color("red")
                    sphere(press_size*.4, $fn=100); 
                    translate([0,-press_size/2,-press_size/2])
                    cube([press_size,press_size,press_size]);
                }
                
                rotate([0,180,90])
                translate([-press_size*3/4,-press_size/2,press_height*.13])
                difference(){
                    color("red")
                    sphere(press_size*.4, $fn=100); 
                    translate([0,-press_size/2,-press_size/2])
                    cube([press_size,press_size,press_size]);
                }
                
                rotate([0,0,90])
                translate([press_size/4,-press_size/2,-press_height*.13])
                difference(){
                    color("red")
                    sphere(press_size*.4, $fn=100); 
                    translate([0,-press_size/2,-press_size/2])
                    cube([press_size,press_size,press_size]);
                }
            }
        }
    
            translate([press_size/2,press_size/2,-1])
            color("red")
            cylinder(h = press_height+1.1, 
            r1 = anolini_radius+5, 
            r2 = anolini_radius+.2, center = false);
    }
}