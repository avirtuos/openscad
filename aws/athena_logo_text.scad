
logo_base_size=454;
logo_base_height=logo_base_size*.20;

pillar_z_offset = 2;
pillar_7_x_scale = .25;
pillar_7_z_scale =  5;

pillar_spacing = .1;
pillar_vs_base_scaling_factor = .65;

normal_pillar_base = .15;
wide_pillar_base = .25;



%cube([logo_base_size, logo_base_height,1.6]);
analytics_pillar_support_height = 230;


text_z=5;

translate([0,7,0])
cube([440,4,text_z]);

translate([0,10,0])
linear_extrude(height = text_z)
text("Athena", font = "Liberation Sans", size=80);
        
translate([340,-3,0])
resize([80,80])
linear_extrude(height = text_z)
import("/Users/virtuoso/Downloads/Athena_logo_pre_processed.dxf");
