use <MCAD/boxes.scad>

anolini_radius=25.4*.5;
anolini_outter_radius=anolini_radius;
press_height=25.4*.5;
press_size=anolini_radius*2*1.4;
press_cut_depth=25.4*.125;
press_seam=4;
use_seam=0;


union(){
    for (i = [0:0]) {
        translate([0,(press_size-1)*i, 0]){
            for (i = [0:0]) {
                translate([i*(press_size-1),0,0])
                single_press();
            }
        }
    }
}




module single_press(){
        union(){
        difference(){
            union(){
                cube([press_size,press_size,press_height]);
                translate([press_size/2,press_size/2,0]){
                    color("yellow")
                    cylinder(h = press_height+press_cut_depth, r1 = anolini_outter_radius+5, r2 = anolini_outter_radius+2, center = false);
                }
                if (use_seam > 0) {
                    translate([press_size/2,press_size/2,1.2]){
                        color("green")
                        difference(){
                            cylinder(h = press_height+press_cut_depth, r1 = anolini_outter_radius+5, r2 = anolini_outter_radius+2.4, center = false);
                            translate([0,0,-1])
                            cylinder(h = press_height+press_cut_depth+2, r1 = anolini_outter_radius+4, r2 = anolini_outter_radius+2, center = false);
                        }
                    }   
                }
            }

            translate([press_size/2,press_size/2,press_height+press_cut_depth+4])
            sphere(anolini_outter_radius*1.12, $fn=100); 
            
            translate([press_size/2,press_size/2,-(press_height*20)+170])
            color("red")
            cylinder(h = press_height*20, r1 = anolini_radius+5, r2 = anolini_radius-press_seam, center = false);

/*
            color("cyan")
            translate([press_size/2,press_size/2,press_height*.52])
            cylinder(h = press_height*.5, r1 = anolini_radius*1.3, r2 = anolini_radius, center = false);

*/
            if (use_seam > 0) {
                translate([press_size/2,press_size/2,press_height+press_cut_depth-13])
                for(i = [0:20]){
                    color("black")
                    rotate([0,0,20*i])
                    roundedBox([2*anolini_outter_radius+(press_seam)-.6,2,press_height+press_cut_depth+3.8],  .5, true, $fn=100);
                }
            }
            color("blue")
            translate([2,press_size/2,-4])
            rotate([0,90,0])
            roundedBox([22,press_size*.78,100],  9, true, $fn=100);

            translate([press_size/2,25,-4])
            rotate([0,90,90])
            roundedBox([22,press_size*.78,100],  9, true, $fn=100);
        }
    }
}