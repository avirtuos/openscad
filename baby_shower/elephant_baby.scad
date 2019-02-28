block_z=25;

difference(){
    linear_extrude(height = block_z)
    import("/Users/virtuoso/Documents/Personal/3D\ Printing/OpenSCAD/baby_shower/elephant_child_bw.dxf");

    translate([19,21,-1])
    cylinder(r=1, h=block_z+2, $fn=100);
}