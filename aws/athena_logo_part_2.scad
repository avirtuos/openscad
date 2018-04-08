
logo_base_size=454;
logo_base_height=logo_base_size*.25;

pillar_z_offset = 2;
pillar_7_x_scale = .25;
pillar_7_z_scale =  5;

pillar_spacing = .1;
pillar_vs_base_scaling_factor = .6;

normal_pillar_base = .15;
wide_pillar_base = .25;


analytics_pillar_support_height = 230;

module analytics_pillar(base_ratio, 
                        height_ratio,
                        x_offset_ratio, 
                        y_offset_ratio, 
                        z_offset_ratio,
                        support_angle){

    difference(){
        pillar_base = logo_base_size * base_ratio;
        pillar_height = logo_base_height * height_ratio;
        
        if(y_offset_ratio > 0) {
                y_offset = (y_offset_ratio * logo_base_size) - pillar_base;
                translate([0,
                    y_offset, 
                    z_offset_ratio*logo_base_height])
                       
            union(){
                cube([pillar_base,pillar_base,pillar_height]);
                color("red")
                translate([pillar_base/2-10, pillar_base/2-10,50])
                rotate(support_angle)
                cube([300, 20, 10]);
            }
            
        } else {
            translate([(x_offset_ratio * logo_base_size) - pillar_base,
                (y_offset_ratio * logo_base_size), 
                 z_offset_ratio*logo_base_height]) 
            
            union(){
                cube([pillar_base,pillar_base,pillar_height]);
                color("red")
                translate([pillar_base/2+10,pillar_base/2,50])
                rotate(support_angle)
                cube([300, 20, 10]);
            }
                      
        }
        
        linear_extrude(1000)
            polygon(points =[
                                [logo_base_size,logo_base_size],
                                [logo_base_size,0],
                                [0,logo_base_size]
                             ]
            );
        
    }
    
    
}




difference(){
    union(){
        //base
        linear_extrude(logo_base_height)
            polygon(points =[
                                [0,0],
                                [logo_base_size,0],
                                [0,logo_base_size]
                            ]
                    );



        //Origin
        analytics_pillar(base_ratio=normal_pillar_base, 
                         height_ratio = 4* pillar_vs_base_scaling_factor, 
                         x_offset_ratio = normal_pillar_base,
                         y_offset_ratio = 0, 
                         z_offset_ratio = 1.5,
                         support_angle=44);

        //X-Pillars
        analytics_pillar(base_ratio=wide_pillar_base, 
                         height_ratio = 3* pillar_vs_base_scaling_factor, 
                         x_offset_ratio = 1- (2 * normal_pillar_base + 2* pillar_spacing), 
                         y_offset_ratio = 0, 
                         z_offset_ratio = 1.5,
                         support_angle=60);

        analytics_pillar(base_ratio=normal_pillar_base, 
                         height_ratio = 4.5* pillar_vs_base_scaling_factor, 
                         x_offset_ratio = 1 - (normal_pillar_base + pillar_spacing),
                         y_offset_ratio = 0, 
                         z_offset_ratio = 1.5,
                         support_angle=105);

        analytics_pillar(base_ratio=normal_pillar_base, 
                         height_ratio = 5 * pillar_vs_base_scaling_factor, 
                         x_offset_ratio = 1,
                         y_offset_ratio = 0, 
                         z_offset_ratio = 1.5,
                         support_angle=135);
                         
                         
        //Y-Pillars
        analytics_pillar(base_ratio=wide_pillar_base, 
                         height_ratio = 2.3* pillar_vs_base_scaling_factor, 
                         x_offset_ratio = 0,
                         y_offset_ratio = 1- (2 * normal_pillar_base + 2* pillar_spacing), 
                         z_offset_ratio = 1.5,
                         support_angle=15);

        analytics_pillar(base_ratio=normal_pillar_base, 
                         height_ratio = 3* pillar_vs_base_scaling_factor, 
                         x_offset_ratio = 0,
                         y_offset_ratio = 1 - (normal_pillar_base + pillar_spacing), 
                         z_offset_ratio = 1.5,
                         support_angle=-25);

        analytics_pillar(base_ratio=normal_pillar_base, 
                         height_ratio = 1.3 * pillar_vs_base_scaling_factor, 
                         x_offset_ratio = 0,
                         y_offset_ratio = 1, 
                         z_offset_ratio = 1.5,
                         support_angle=-45);
             
        difference(){
            translate([logo_base_size/2-20,logo_base_size/2-20,0])
            cube([40,40,230]);
            linear_extrude(1000)
                    polygon(points =[
                                        [logo_base_size,logo_base_size],
                                        [logo_base_size,0],
                                        [0,logo_base_size]
                                     ]
                    );
        }
    }

    linear_extrude(1000)
                polygon(points =[
                                    [logo_base_size,logo_base_size],
                                    [0,0],
                                    [0,logo_base_size]
                                 ]
                );
}