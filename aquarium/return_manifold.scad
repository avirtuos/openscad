manifold_size=2*25.4;


union(){
translate([20,0,manifold_size - 6])
barb(barb_od=24, barb_id=21, barb_length=3*25.4, barb_max=2);

translate([20,0,6])
rotate([180,0,0])
barb(barb_od=24, barb_id=21, barb_length=3*25.4, barb_max=2);


translate([15,manifold_size/2 - 3,manifold_size/2])
rotate([-90,0,0])
barb(barb_od=11.5, barb_id=9.5, barb_length=2*25.4, barb_max=1.5);

translate([15+25.4,manifold_size/2 - 3,manifold_size/2])
rotate([-90,0,0])
barb(barb_od=11.5, barb_id=9.5, barb_length=2*25.4, barb_max=1.5);

translate([15+(2*25.4),manifold_size/2 - 3,manifold_size/2])
rotate([-90,0,0])
barb(barb_od=11.5, barb_id=9.5, barb_length=2*25.4, barb_max=1.5);

translate([0,0,manifold_size/2])
rotate([0,90,0])
difference(){
    cylinder(r1=manifold_size/2,r2=manifold_size/2, h=3*25.4, $fn=100);
    translate([0,0,7])
    cylinder(r1=-3+manifold_size/2,r2=-3+manifold_size/2, h=-6 + 3*25.4, $fn=100);
}

translate([0,17,8])
rotate([135,0,0])
cube([2*25.4, manifold_size-1.2, 3]);

}

cylinder

/*
elbow
        translate([18,0,0])
        rotate([90,0,0])
        difference(){
        rotate_extrude(convexity = 10, $fn=100)
        translate([.8*25.4, 0, 0])
        circle(r = coupler_od/2, $fn=100);
            
            translate([-100,0,-100])
            cube([200,200,200]);
            
            rotate_extrude(convexity = 10, $fn=100)
            translate([.8*25.4, 0, 0])
            circle(r = coupler_id/2, $fn=100);
        }
        */

module barb(barb_od=24, barb_id=21, barb_length=3*25.4, barb_max=2, solid=0){
    union(){
        translate([-2.3,0,0])
        difference(){
            union(){
                    cylinder(r1=(barb_od/2)+barb_max, 
                             r2=(barb_od/2),
                             h=barb_length+.2, 
                             $fn=100);

                num_barbs=5;
                barb_spacing = barb_length / (num_barbs+2);
                for(i = [0:num_barbs]){
                    barb_size_1=(((num_barbs-i)/num_barbs)*barb_max)+.3;
                    barb_size_2=barb_size_1*0.7;
                    color("red")
                    translate([0,0,barb_spacing + (barb_spacing * i)])
                        cylinder(r1=(barb_od/2)+barb_size_1, 
                                 r2=(barb_od/2)+barb_size_2,
                                 h=2, 
                                 $fn=100);
                    color("blue")
                    translate([0,0,barb_spacing + (barb_spacing * i) - 1])
                        cylinder(r1=(barb_od/2)+barb_size_2,
                                 r2=(barb_od/2)+barb_size_1, 
                                 h=1, 
                                 $fn=100);
                }
            }
                translate([0,0,-.01])
                cylinder(r1=(barb_id/2), 
                         r2=(barb_id/2),
                         h=barb_length+1, 
                         $fn=100);
        }
    }
}







