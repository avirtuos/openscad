

outter_radius=41;
diffuser_thickness=1;
inner_radius=outter_radius-diffuser_thickness;
diffuser_height=126;
$fn=100;

outter_connection_radius=31.75;
connection_thickness=3;
inner_connection_radius=outter_connection_radius-connection_thickness;
connection_height=13.6;

connection_ring_height=8.25;
connection_ring_outter_radius=outter_connection_radius+1.8;
connection_ring_inner_radius=outter_connection_radius-3;

connection_ring_opening=20;


difference(){
    union(){
        difference(){
            cylinder(r1=outter_radius, r2=outter_radius, h=diffuser_height);
            cylinder(r1=inner_radius, r2=inner_radius, h=diffuser_height-3);
        }
        translate([0,0,diffuser_height])
        difference(){
            cylinder(r1=outter_connection_radius, r2=outter_connection_radius, h=connection_height);
            cylinder(r1=inner_connection_radius, r2=inner_connection_radius, h=connection_height-3);
        }
    }
    cylinder(r1=inner_connection_radius, r2=inner_connection_radius, h=diffuser_height*2);
}


    difference(){
        color("green"){
            translate([0,0,diffuser_height+connection_height-connection_ring_height])
            difference(){
            cylinder(r1=connection_ring_outter_radius, r2=connection_ring_outter_radius, h=connection_ring_height-.1);
            cylinder(r1=connection_ring_inner_radius, r2=connection_ring_inner_radius, h=connection_ring_height);
            }
        }
        notch_height=diffuser_height+connection_height;
        for (i = [0:2]) {
            triangle_points =[[0,0],
            [0,connection_ring_height],
            [connection_ring_opening,connection_ring_height],
            [connection_ring_opening,0]];
            rotate([-90,0,120 * i])
            translate([-connection_ring_opening/2,-1*notch_height,-connection_ring_opening/2]){
            linear_extrude(height = connection_ring_outter_radius*2)
            polygon(triangle_points,[],10);
            }
        }
        
        for (i = [0:2]) {
            triangle_points =[[0,0],
            [0,connection_ring_height],
            [connection_ring_opening+40,connection_ring_height],
            [connection_ring_opening+40,0]];
            rotate([-90,0,120 * i])
            translate([-connection_ring_opening/2,-1*notch_height,-connection_ring_opening/2]){
            rotate([0,0,10])
            linear_extrude(height = connection_ring_outter_radius*2)
            polygon(triangle_points,[],10);
            }
        }
    }

    connection_lock_height=connection_height;
    connection_lock_width=7;
    intersection(){
        color("red"){
            translate([0,0,diffuser_height])
            difference(){
            cylinder(r1=connection_ring_outter_radius, r2=connection_ring_outter_radius, h=connection_height-.1);
            cylinder(r1=connection_ring_inner_radius, r2=connection_ring_inner_radius, h=connection_height);
            }
        }
        notch_height=diffuser_height+connection_lock_height;
        for (i = [0:2]) {
            triangle_points =[[0,0],
            [0,connection_lock_height],
            [connection_lock_width,connection_lock_height],
            [connection_lock_width,0]];
            rotate([-90,0,20+ 120 * i])
            translate([-connection_lock_width/2,-1*diffuser_height-connection_lock_height,-connection_lock_width/2]){
            linear_extrude(height = connection_ring_outter_radius*2)
            polygon(triangle_points,[],10);
            }
        }
    }

 