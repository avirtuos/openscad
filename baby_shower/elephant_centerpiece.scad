block_z=1.2;

dfx_file="/Users/virtuoso/Documents/Personal/3D\ Printing/OpenSCAD/baby_shower/elephant_centerpiece_bw.dxf";

linear_extrude(height = block_z)
scale(.98)
import(dfx_file);
  