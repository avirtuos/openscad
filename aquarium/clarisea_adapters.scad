

coupler_od=33.5;
coupler_id=30;
coupler_length=23;

barb_od=24;
barb_id=22;
barb_length=3*25.4;

difference(){
    cylinder(r1=(coupler_od/2)-.05, 
             r2=(coupler_od/2)+.2,
             h=coupler_length, 
             $fn=1000);

    translate([0,0,-.1])
    cylinder(r1=(coupler_id/2), 
             r2=(coupler_id/2),
             h=coupler_length+.2, 
             $fn=1000);
}

difference(){
    union(){
        translate([0,0,coupler_length+5])
        cube([50,5,10]);
        
        translate([0,0,coupler_length])
            cylinder(r1=(coupler_od/2)+.2, 
                     r2=(coupler_od/2)-4,
                     h=10, 
                     $fn=1000);

        translate([0,0,coupler_length])
            cylinder(r1=(barb_od/2)+1.5, 
                     r2=(barb_od/2),
                     h=barb_length+.2, 
                     $fn=1000);

        color("red")
        translate([0,0,coupler_length+(barb_length*.8)])
            cylinder(r1=(barb_od/2)+.8, 
                     r2=(barb_od/2)+.3,
                     h=2, 
                     $fn=1000);

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
                     $fn=1000);
                     
        color("red")
        translate([0,0,coupler_length+(barb_length*.2)])
            cylinder(r1=(barb_od/2)+1.5, 
                     r2=(barb_od/2)+1.2,
                     h=2, 
                     $fn=1000);
    }
    
    cylinder(r1=(barb_id/2), 
             r2=(barb_id/2),
             h=barb_length+coupler_length+1, 
             $fn=1000);
}