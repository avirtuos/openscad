
padding=2.5;
inner_width=113 + padding;
inner_length=240 + padding;
inner_radius=144/2  + padding;
height=150;
wall_thickness=.8;
$fn=100;
magnet_r=2.7;
magnet_d=3.2;



difference(){
    union(){
        difference(){
           union(){
                cube([inner_length+(2*wall_thickness)
                        , inner_width+(2*wall_thickness)
                        , height+wall_thickness]);
                translate([wall_thickness+ inner_length/2,wall_thickness + inner_width/2,0])
                cylinder(r1=inner_radius+wall_thickness, r2=inner_radius+wall_thickness, h=height+wall_thickness);
            }
            translate([wall_thickness,wall_thickness,wall_thickness+.1])
            union(){
                cube([inner_length, inner_width,height]);
                translate([inner_length/2,inner_width/2,0])
                cylinder(r1=inner_radius, r2=inner_radius, h=height+wall_thickness);
            }
        }

            translate([0,magnet_r*2+2,height+wall_thickness]){
                rotate([0,90,-90])
                color("red")
                triangle(magnet_r*2+2,magnet_r*3+2,magnet_r*2+2);
            }
            
            translate([inner_length-(2*wall_thickness)+(magnet_r*2-2.2)
            ,0
            ,height+wall_thickness]){
                rotate([0,90,90])
                color("red")
                triangle(magnet_r*2+2,magnet_r*3+2,magnet_r*2+2);
            }
            
           translate([0
            ,inner_width-(2*wall_thickness)+(magnet_r*2-2.2)
            ,height+wall_thickness]){
                rotate([0,90,-90])
                color("red")
                triangle(magnet_r*2+2,magnet_r*3+1,magnet_r*2+2);
            }
            
            translate([inner_length-(2*wall_thickness)+(magnet_r*2-2.2)
            ,inner_width+(2*wall_thickness)-(magnet_r*2+2)
            ,height+wall_thickness]){
                rotate([0,90,90])
                color("red")
                triangle(magnet_r*2+2,magnet_r*3+2,magnet_r*2+2);
            }
        }

    translate([magnet_r+1,magnet_r+1,height+wall_thickness-magnet_d+.1]){
        cylinder(r1=magnet_r,r2=magnet_r,h=magnet_d);
    }

    translate([inner_length-2,magnet_r+1,height+wall_thickness-magnet_d+.1]){
        cylinder(r1=magnet_r,r2=magnet_r,h=magnet_d);
    }

    translate([magnet_r+1,inner_width-2,height+wall_thickness-magnet_d+.1]){
        cylinder(r1=magnet_r,r2=magnet_r,h=magnet_d);
    }

    translate([inner_length-2,inner_width-2,height+wall_thickness-magnet_d+.1]){
        cylinder(r1=magnet_r,r2=magnet_r,h=magnet_d);
    }
}

module triangle(o_len, a_len, depth, center=false)
{
    centroid = center ? [-a_len/3, -o_len/3, -depth/2] : [0, 0, 0];
    translate(centroid) linear_extrude(height=depth)
    {
        polygon(points=[[0,0],[a_len,0],[0,o_len]], paths=[[0,1,2]]);
    }
}