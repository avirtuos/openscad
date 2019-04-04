
padding=2.5;
inner_width=103 + padding;
inner_length=240 + padding;
inner_radius=144/2  + padding;
height=25.4*2;
wall_thickness=1.5;



difference(){
   union(){
        cube([inner_length+(2*wall_thickness)
                , inner_width+(2*wall_thickness)
                , height+wall_thickness]);
        translate([wall_thickness+ inner_length/2,wall_thickness + inner_width/2,0])
        cylinder(r1=inner_radius+wall_thickness, r2=inner_radius+wall_thickness, h=height);
    }
    translate([wall_thickness,wall_thickness,wall_thickness+.1])
    union(){
        cube([inner_length, inner_width,height]);
        translate([inner_length/2,inner_width/2,0])
        cylinder(r1=inner_radius, r2=inner_radius, h=height);
    }
}