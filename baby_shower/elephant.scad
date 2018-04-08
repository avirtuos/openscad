block_xy_size=127;
block_z=25;

difference(){
    linear_extrude(height = block_z)
    import("/Users/virtuoso/Documents/Personal/3D\ Printing/OpenSCAD/baby_shower/elephant.dxf");

    translate([53,0,-5])
    rotate([0,0,28])
    cube([100,100,block_z+10]);
}