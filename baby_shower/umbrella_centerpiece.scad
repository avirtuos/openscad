block_z=1.2;

dfx_file="/Users/virtuoso/Documents/Personal/3D\ Printing/OpenSCAD/baby_shower/umbrella_centerpiece_bw.dxf";

translate([0,-35,0])
linear_extrude(height = block_z)
import(dfx_file);
  