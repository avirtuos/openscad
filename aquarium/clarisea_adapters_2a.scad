

coupler_od=37.4;
coupler_id=32.8;
coupler_length=30;

barb_od=37;
barb_id=34.6;
barb_length=3*25.4;

difference(){
union(){
        difference(){
            union(){
                translate([18,0,0])
                rotate([90,0,0])
                difference(){
                rotate_extrude(convexity = 10, $fn=100)
                translate([.9*25.4, 0, 0])
                circle(r = coupler_od/2, $fn=100);
                    
                    translate([-100,0,-100])
                    cube([200,200,200]);
                    
                    rotate_extrude(convexity = 10, $fn=100)
                    translate([.9*25.4, 0, 0])
                    circle(r = coupler_id/2 - .4, $fn=100);
                }

                translate([-4.8,0,0])
                difference(){
                    cylinder(r1=(coupler_od/2), 
                             r2=(coupler_od/2),
                             h=coupler_length, 
                             $fn=100);

                    translate([0,0,-.1])
                    cylinder(r1=(coupler_id/2), 
                             r2=(coupler_id/2),
                             h=coupler_length+.2, 
                             $fn=100);
                }

                translate([coupler_od+3.4,0,coupler_length])
                rotate([180,0,0])
                difference(){
                    cylinder(r1=(coupler_od/2), 
                             r2=(coupler_od/2),
                             h=coupler_length, 
                             $fn=100);

                    translate([0,0,-.1])
                    cylinder(r1=(coupler_id/2)+.3, 
                             r2=(coupler_id/2)-.4,
                             h=coupler_length+.2, 
                             $fn=100);
                }
                translate([-4.8,0,0])
                difference(){
                    union(){
                        translate([0,0,coupler_length-10])
                            cylinder(r1=barb_od/2, 
                                     r2=barb_od/2+1.75,
                                     h=10, 
                                     $fn=100);

                        translate([0,0,coupler_length])
                            cylinder(r1=(barb_od/2)+1.25, 
                                     r2=(barb_od/2),
                                     h=barb_length+.2, 
                                     $fn=100);

                        color("red")
                        translate([0,0,coupler_length+(barb_length*.8)])
                            cylinder(r1=(barb_od/2)+.8, 
                                     r2=(barb_od/2)+.3,
                                     h=2, 
                                     $fn=100);

                        color("red")
                        translate([0,0,coupler_length+(barb_length*.6)])
                            cylinder(r1=(barb_od/2)+.9, 
                                     r2=(barb_od/2)+.6,
                                     h=2, 
                                     $fn=1000);

                        color("red")
                        translate([0,0,coupler_length+(barb_length*.4)])
                            cylinder(r1=(barb_od/2)+1.2, 
                                     r2=(barb_od/2)+.9,
                                     h=2, 
                                     $fn=100);
                                     
                        color("red")
                        translate([0,0,coupler_length+(barb_length*.2)])
                            cylinder(r1=(barb_od/2)+1.5, 
                                     r2=(barb_od/2)+1.2,
                                     h=2, 
                                     $fn=100);
                    }
                    
                    cylinder(r1=(barb_id/2), 
                             r2=(barb_id/2),
                             h=barb_length+coupler_length+1, 
                             $fn=100);
                    
                    translate([0,0,coupler_length-.01])
                    cylinder(r1=(coupler_id/2), 
                             r2=(coupler_id/2)-7,
                             h=12, 
                             $fn=100);
                }
            }

            translate([-50,-50,-51.02])
            color("red")
            cube([100,100,10]);
            
            

        }

        translate([-10,-20,-41.1])
        color("red")
        cube([60,40,2]);
}

//translate([-50,0,-50])
//cube([200,200,200]);
}




