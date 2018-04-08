

logo_base_size=454;
logo_base_height=logo_base_size*.25;

pillar_z_offset = 2;
pillar_7_x_scale = .25;
pillar_7_z_scale =  5;

pillar_spacing = .1;
pillar_vs_base_scaling_factor = .6;

normal_pillar_base = .15;
wide_pillar_base = .25;


%cube([logo_base_size, logo_base_height,1.6]);
analytics_pillar_support_height = 230;


text_z=5;

difference(){
    union(){
        translate([0,18,0])
        cube([435,4,1]);

        translate([0,20,0])
        linear_extrude(height = text_z)
        text("Athena", font = "Liberation Sans", size=80);
                
        translate([340,7,0])
        resize([80,80])
        linear_extrude(height = text_z)
        import("/Users/virtuoso/Downloads/Athena_logo_pre_processed.dxf");
    }

    translate([0,-10,-10])
    cube([logo_base_size/2,300,300]);
}