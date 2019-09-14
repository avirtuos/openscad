
barb_od=37;
barb_id=34.6;
barb_length=3*25.4;

barb2_od=24.5;
barb2_id=22.5;
barb2_length=3*25.4;

coupler_length=3*25.4;

difference(){
union(){
            union(){
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
                    
                     translate([0,0,coupler_length-.01 - 10])
                    cylinder(r1=(barb2_id/2), 
                             r2=(barb_id/2),
                             h=barb_length+12, 
                             $fn=100);
                }
            }
            
            translate([0,0,133])
            rotate([180,0,0])
            union(){
                translate([-4.8,0,0])
                difference(){
                    union(){
                        translate([0,0,coupler_length-10])
                            cylinder(r1=barb_od/2 + .5, 
                                     r2=barb2_od/2+1.75,
                                     h=10, 
                                     $fn=100);

                        translate([0,0,coupler_length])
                            cylinder(r1=(barb2_od/2)+1.25, 
                                     r2=(barb2_od/2),
                                     h=barb2_length+.2, 
                                     $fn=100);

                        color("red")
                        translate([0,0,coupler_length+(barb2_length*.8)])
                            cylinder(r1=(barb2_od/2)+.8, 
                                     r2=(barb2_od/2)+.3,
                                     h=2, 
                                     $fn=100);

                        color("red")
                        translate([0,0,coupler_length+(barb2_length*.6)])
                            cylinder(r1=(barb2_od/2)+.9, 
                                     r2=(barb2_od/2)+.6,
                                     h=2, 
                                     $fn=1000);

                        color("red")
                        translate([0,0,coupler_length+(barb2_length*.4)])
                            cylinder(r1=(barb2_od/2)+1.2, 
                                     r2=(barb2_od/2)+.9,
                                     h=2, 
                                     $fn=100);
                                     
                        color("red")
                        translate([0,0,coupler_length+(barb2_length*.2)])
                            cylinder(r1=(barb2_od/2)+1.5, 
                                     r2=(barb2_od/2)+1.2,
                                     h=2, 
                                     $fn=100);
                    }
                    
                    cylinder(r1=(barb2_id/2), 
                             r2=(barb2_id/2),
                             h=barb2_length+coupler_length+1, 
                             $fn=100);
                }
            }
}

//translate([-50,0,-50])
//cube([200,200,200]);
}




