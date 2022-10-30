

coupler_od=18;
coupler_id=coupler_od - 2;
coupler_length=2*25.4;

spout_od=.9*coupler_od;
spout_id=spout_od - 2;
spout_length=2.25*25.4;
spout_angle=70;
spout_angle_z=120;

siphon_break=1.5;
$fn=100;

difference(){
    union(){
        cylinder(r1=-.05 + coupler_od/2, r2=.5 +coupler_od/2,h=coupler_length);
        
        color("red")
        translate([0,0,coupler_length-12.5])
        rotate([spout_angle, spout_angle_z,0])
        cylinder(r1=spout_od/2, r2=spout_od/2,h=spout_length);

        color("green")
        translate([0,0,coupler_length-12.5])
        rotate([-spout_angle,spout_angle_z,0])
        cylinder(r1=spout_od/2, r2=spout_od/2,h=spout_length);
    }

    union(){
        cylinder(r1=coupler_id/2, r2=coupler_id/2,h=coupler_length-5);
        
        color("red")
        translate([0,0,coupler_length-12.5])
        rotate([spout_angle, spout_angle_z,0])
        cylinder(r1=spout_id/2, r2=spout_id/2,h=spout_length+.2);

        color("green")
        translate([0,0,coupler_length-12.5])
        rotate([-spout_angle,spout_angle_z,0])
        cylinder(r1=spout_id/2, r2=spout_id/2,h=spout_length+.2);
    }
    
    translate([-4,0,coupler_length - 9.9])
    cylinder(r1=siphon_break,
             r2=siphon_break,
            h=10);
}
