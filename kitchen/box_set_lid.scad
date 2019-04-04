
padding=2.5;
inner_width=113 + padding;
inner_length=240 + padding;
inner_radius=144/2  + padding;
height=5;
wall_thickness=1.5;
$fn=100;
magnet_r=2.7;
magnet_d=3.2;

color("white"){
    translate([inner_length*.43,inner_width+3,0]){
        linear_extrude(height = height+3, center = false, convexity = 10)
        text("Pasta", font="Liberation Sans:style=Bold");
    }
    
    translate([inner_length*.4,-8,0]){
        linear_extrude(height = height+3, center = false, convexity = 10)
        text("Paisano", font="Liberation Sans:style=Bold");
    }
    
    translate([inner_length*.36,10,0]){
        linear_extrude(height = height+3, center = false, convexity = 10){
            scale([1.1,1.1,1.1])
           import (file = "paisano.dxf");
        }
    }
}
color("brown"){
difference(){
    union(){
        cube([inner_length+(2*wall_thickness)
                        , inner_width+(2*wall_thickness)
                        , height+wall_thickness]);
        translate([wall_thickness+ inner_length/2,wall_thickness + inner_width/2,0])
        cylinder(r1=inner_radius+wall_thickness, r2=inner_radius+wall_thickness, h=height+wall_thickness);
    }
       
    translate([magnet_r+.5,magnet_r+.5,-.1]){
        cylinder(r1=magnet_r,r2=magnet_r,h=magnet_d);
    }

    translate([inner_length-.2,magnet_r+.5,-.1]){
        cylinder(r1=magnet_r,r2=magnet_r,h=magnet_d);
    }

    translate([magnet_r+.5,inner_width-.2,-.1]){
        cylinder(r1=magnet_r,r2=magnet_r,h=magnet_d);
    }

    translate([inner_length-.2,inner_width-.2,-.1]){
        cylinder(r1=magnet_r,r2=magnet_r,h=magnet_d);
    }
}}