support_spike_x=152.4;
support_spike_y=15;
support_spike_notch_z=1.2; //from elephant file
support_spike_z=1.2 + support_spike_notch_z;

difference(){
    union(){
        cube([support_spike_x, support_spike_y, support_spike_z]);
        
        color("red")
        translate([support_spike_x + 4.2,7.5,0])
        cylinder(d=support_spike_y+2.4,h=support_spike_z,$fn=3);
    }

    color("blue")
    translate([-1,-1,(support_spike_z - support_spike_notch_z)/2])
    cube([11,support_spike_y+2,support_spike_notch_z]);
}