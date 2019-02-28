use <nutsnbolts/cyl_head_bolt.scad>;
use <nutsnbolts/materials.scad>;

chamber_r=50.8;
chamber_h=76.2;
chamber_inner_r=chamber_r-3;
chamber_thread_r=4;
chamber_thread_h=20;

press_support_x=chamber_r;
press_support_y=(2*chamber_r)+10;
press_support_z=5;

press_plate_h=10;

// points = number of points (minimum 3)
// outer  = radius to outer points
// inner  = radius to inner points
module star(points, outer, inner) {
	
	// polar to cartesian: radius/angle to x/y
	function x(r, a) = r * cos(a);
	function y(r, a) = r * sin(a);
	
	// angular width of each pie slice of the star
	increment = 360/points;
	
	union() {
		for (p = [0 : points-1]) {
			
			// outer is outer point p
			// inner is inner point following p
			// next is next outer point following p

			assign(	x_outer = x(outer, increment * p),
					y_outer = y(outer, increment * p),
					x_inner = x(inner, (increment * p) + (increment/2)),
					y_inner = y(inner, (increment * p) + (increment/2)),
					x_next  = x(outer, increment * (p+1)),
					y_next  = y(outer, increment * (p+1))) {
				polygon(points = [[x_outer, y_outer], [x_inner, y_inner], [x_next, y_next], [0, 0]], paths  = [[0, 1, 2, 3]]);
			}
		}
	}
}


difference(){
    union(){
       
        translate([0,0,0])
        cylinder(r=chamber_r+10, h=20, $fin=100);
        
        df = _get_fam("M64");
        nutkey = chamber_r+chamber_thread_r+75;
        nutheight = 51;
        orad = chamber_r+chamber_thread_r;
        lead = 6;
        irad = 26;

        e = _calc_HexInscToSubscRadius(nutkey/2);
        translate([0,0,nutheight/2]) {
            difference() {
                hexaprism(ri=nutkey/2, h=nutheight);
                cylinder(r=irad, h=nutheight+0.1, center=true);
                translate([0,0,-nutheight/2]) thread(orad, nutheight, lead);
                translate([0,0,-nutheight/2]) cylinder(r1=orad, r2=irad, h=lead, center=true);
                translate([0,0,nutheight/2]) cylinder(r2=orad, r1=irad, h=lead, center=true);
            }
        }
    }
    
    color("red")
    translate([0, 0, -1])
    linear_extrude(30)
    star(5, chamber_r*.6, chamber_r*.3);

}

