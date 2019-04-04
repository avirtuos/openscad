
//6inch diameter
//1/8 dough
//makes 2
//The dough is typically 6inch in diameter + .25 overhang +  0.5 lost to filling depth
dough_radius=25.4*2.83;
press_seam_width=25.4*.25;
press_seam_height=25.4*.125;
press_cut_width=2;
press_cut_height=2;
press_height=25.4*1;

seam_ridge_width=3.55625;
seam_ridge_depth=3.4;
$fn=100;

difference(){
        difference(){
                    color("green")
                    cylinder(r1=dough_radius, r2=dough_radius, h=press_height);
                    
                    translate([0,0,-1])
                    cylinder(r1=dough_radius-press_seam_width-press_cut_width, r2=dough_radius-press_seam_width-press_cut_width, h=press_height+2);
                        
                    translate([0,0,press_height-press_cut_height])
                    cylinder(r1=dough_radius-press_cut_width, r2=dough_radius-press_cut_width, h=press_seam_height);
            
                    translate([0,0,press_height-press_cut_height+.1]){
                        for (i = [0:120]) {
                            triangle_points =[[0,0],
                            [seam_ridge_width/2,seam_ridge_depth],
                            [seam_ridge_width,0]];
                            rotate([-90,0,4 * i])
                            linear_extrude(height = dough_radius-3)
                            polygon(triangle_points,[],10);
                        }
                    }

                    translate([0,0,-.1])
                    cylinder(r1=dough_radius-3, r2=dough_radius-press_seam_width-press_cut_width, h=press_height-10);
            }
    
    
    for(i = [0:11]){
        rotate([0,0,15 + 30*i])
        translate([dough_radius/6,0,-.1]){
            triangle_points =[  [0,0],
                                [dough_radius/4,dough_radius/4],
                                [dough_radius/4,0]];
            rotate([90,225,0])
            linear_extrude(height = dough_radius+10)
            polygon(triangle_points,[],10);
        }
    }
}

for(j = [0:1]){
    rotate([0,0,90*j])
    difference(){
        union(){
            difference(){
                translate([-press_seam_width,-dough_radius+press_seam_width,0])
                cube([press_seam_width*2,dough_radius*2-(press_seam_width*2),press_height-press_cut_height]);

                translate([press_seam_width,0,press_height-press_cut_height+.1]){    
                    triangle_points =[[0,0],[seam_ridge_width/2,seam_ridge_depth],[seam_ridge_width,0]];
                    rotate([-90,0,90])
                    for(i = [-40:40]){
                        color("red")
                        translate([i*(seam_ridge_width+1.2),0,-.1])
                        linear_extrude(height = press_seam_width*2.2)
                        polygon(triangle_points,[],10);
                    }
                }

                translate([0,0,-.1])
                cylinder(r1=dough_radius-4, r2=dough_radius-press_seam_width, h=press_height-10);           
            }
             
            translate([-press_cut_width/2,-dough_radius*.99,0])
            cube([press_cut_width,dough_radius*1.98,press_height]);
                    
            translate([press_seam_width,dough_radius*.965,press_height-9]){
                triangle_points =[[-.4,0],[press_seam_width,press_seam_width*2],[press_seam_width,0]];
                rotate([90,180,0])
                linear_extrude(height = dough_radius*1.93)
                polygon(triangle_points,[],10);
            }
                    
            translate([-press_seam_width,-dough_radius*.965,press_height-9]){
                triangle_points =[[-.4,0],[press_seam_width,press_seam_width*2],[press_seam_width,0]];
                rotate([90,180,180])
                linear_extrude(height = dough_radius*1.93)
                polygon(triangle_points,[],10);
            }
        }
        
        for(i = [-3:7]){
            translate([-dough_radius/2,(dough_radius/2) * i - 7,-.1]){
                triangle_points =[  [0,0],
                                    [dough_radius/4,dough_radius/4],
                                    [dough_radius/4,0]];
                rotate([90,225,90])
                linear_extrude(height = dough_radius+10)
                polygon(triangle_points,[],10);
            }
        }
    }
}

