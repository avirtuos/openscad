
//6inch diameter
//1/8 dough
//makes 2
//The dough is typically 6inch in diameter + .25 overhang +  0.5 lost to filling depth
dough_radius=25.4*2.25;
press_seam_width=25.4*.33;
press_seam_height=25.4*.125;
press_cut_width=2;
press_cut_height=2;
press_height=25.4*1.75;

seam_ridge_width=3.55625;
seam_ridge_depth=3.4;
$fn=100;

difference(){
    union(){
        difference(){
            union(){
                difference(){
                    cylinder(r1=dough_radius, r2=dough_radius, h=press_height);
                    
                    translate([0,0,-1])
                    cylinder(r1=dough_radius-press_seam_width, r2=dough_radius-press_seam_width, h=press_height+2);
                        
                    translate([0,0,press_height-press_cut_height])
                    cylinder(r1=dough_radius-press_cut_width, r2=dough_radius-press_cut_width, h=press_seam_height);

                    difference(){
                        translate([0,0,press_height-press_cut_height+.1]){
                            for (i = [0:80]) {
                                triangle_points =[[0,0],[seam_ridge_width/2,seam_ridge_depth],[seam_ridge_width,0]];
                                rotate([-90,0,6 * i])
                                linear_extrude(height = dough_radius-3)
                                polygon(triangle_points,[],10);
                            }
                        }
                        translate([0,0,-10])
                        cylinder(r1=dough_radius-press_seam_width, r2=dough_radius-press_seam_width, h=press_height+2);
                          
                    }
                }


                difference(){
                    translate([-press_seam_width,-dough_radius+press_seam_width,0])
                    cube([press_seam_width*2,dough_radius*2-(press_seam_width*2),press_height-press_cut_height]);

                    translate([press_seam_width,0,press_height-press_cut_height+.1]){    
                        triangle_points =[[0,0],[seam_ridge_width/2,seam_ridge_depth],[seam_ridge_width,0]];
                        rotate([-90,0,90])
                        for(i = [-16:15]){
                            color("red")
                            translate([i*seam_ridge_width,0,-.1])
                            linear_extrude(height = press_seam_width*2.2)
                            polygon(triangle_points,[],10);
                        }
                    }
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
    
    
rotate([0,0,45])
translate([dough_radius/3,dough_radius*2,-.1]){
    triangle_points =[  [0,0],
                        [dough_radius/2,dough_radius/2],
                        [dough_radius/2,0]];
    rotate([90,225,0])
    linear_extrude(height = dough_radius*4)
    polygon(triangle_points,[],10);
}

rotate([0,0,135])
translate([dough_radius/3,dough_radius*2,-.1]){
    triangle_points =[  [0,0],
                        [dough_radius/2,dough_radius/2],
                        [dough_radius/2,0]];
    rotate([90,225,0])
    linear_extrude(height = dough_radius*4)
    polygon(triangle_points,[],10);
}

rotate([0,0,90])
translate([dough_radius/3,dough_radius*.5,-1]){
    triangle_points =[  [0,0],
                        [dough_radius/2,dough_radius/2],
                        [dough_radius/2+7,-7]];
    rotate([90,225,0])
    linear_extrude(height = dough_radius)
    polygon(triangle_points,[],10);
}
}

