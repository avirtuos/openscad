
logo_base_size=55.8;
logo_base_height=logo_base_size*.25;

%cube([logo_base_size, logo_base_height,1.6]);

text_z=3;

translate([2,1,0])
cube([logo_base_size-5,1,text_z-.5]);

translate([2,1.75,0])
linear_extrude(height = text_z)
text("Athena", font = "Liberation Sans", size=10);
        
translate([43.25,-.20,0])
resize([11,11])
linear_extrude(height = text_z)
import("/Users/virtuoso/Downloads/Athena_logo_pre_processed.dxf");
