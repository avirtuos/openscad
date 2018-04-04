use <MCAD/boxes.scad>
use <virtuoso/utils.scad>

/*
 * settings
 */
 
isDraft = true;

//display_x=170.2;
//display_y=111.2;
//display_z=1;

case_pad_x=3;
case_pad_y=3;
case_pad_z=3;

case_logic_board_x=30;
case_logic_board_overlap_x=30;
case_logic_board_z=5; //TODO: set ot 17
logic_bracket_pad=2;

display_view_x=164.5;
display_view_y=99;
display_view_z=1;

display_view_y_top_offset=3.2;
display_view_y_bottom_offset=9;
display_view_x_left_offset=3.5;
display_view_x_right_offset=3.5;


/*
 * Setting Calculations
 */

case_real_x=display_view_x+case_logic_board_x+(2*case_pad_x)+ display_view_x_left_offset + display_view_x_right_offset;
case_real_y=display_view_y+(2*case_pad_y)+ display_view_y_top_offset + display_view_y_bottom_offset;
case_real_z=case_pad_z;

display_real_x = display_view_x + display_view_x_left_offset + display_view_x_left_offset+1;
display_real_y = display_view_y+ display_view_y_top_offset + display_view_y_bottom_offset+1;

display_bracket_x = case_real_x - case_logic_board_x;
display_bracket_y = case_real_y;
display_bracket_z = 2.5;

case_hump_x=case_logic_board_x + case_logic_board_overlap_x + display_view_x_left_offset + display_view_x_left_offset;
case_hump_y=case_real_y;
case_hump_z=case_logic_board_z+case_pad_z;

 
    /*
     *  PCB Base
     */
    translate([(case_real_x)/2,(case_real_y)/2,(case_real_z)/2]){
      
        //Display Face Of Case
        color("blue")
        difference(){
            //face of the display
            roundedBox([case_real_x, case_real_y, case_real_z],  5, true, $fn=100);
            
            translate([-case_logic_board_x/2 - display_view_x_left_offset + display_view_x_right_offset,
                        display_view_y_top_offset, 
                        0]){
            //display's viewable area
            roundedBox([display_view_x, display_view_y, display_view_z+10], 
                    5, true, $fn=100);
            }
        }
       
        //Display Bracket
        color("red")
        translate([-case_logic_board_x/2,0,case_real_z - (case_real_z - display_bracket_z)/2]){
            difference(){
            roundedBox([display_bracket_x, 
                        display_bracket_y, 
                       display_bracket_z], 
                        5, true, $fn=100);
            
            roundedBox([display_real_x,display_real_y,100], 5, true, $fn=100);
            }
        }
        
        //Logic Board Hump
        color("green")
        translate([(case_real_x-case_hump_x)/2,0,(case_real_z+case_hump_z)/2]){
            
            if(!isDraft){
                translate([case_logic_board_overlap_x-7,case_hump_y/2-3-logic_bracket_pad,case_hump_z/2-2])  screw_plate(5,3,2, $fn=100);
                translate([case_logic_board_overlap_x-7,-case_hump_y/2+logic_bracket_pad/2,case_hump_z/2-2])  screw_plate(5,3,2, $fn=100);
                translate([-case_logic_board_overlap_x,case_hump_y/2-3-logic_bracket_pad,case_hump_z/2-2])  screw_plate(5,3,2, $fn=100);
                translate([-case_logic_board_overlap_x,-case_hump_y/2+logic_bracket_pad/2,case_hump_z/2-2])  screw_plate(5,3,2, $fn=100);
            }
            difference(){
                roundedBox([case_hump_x, case_hump_y, case_hump_z],  5, true, $fn=100);
                translate([-10,0,0]){
                    
                    roundedBox([case_hump_x-logic_bracket_pad+20, 
                                case_hump_y-logic_bracket_pad, 
                                case_hump_z+10],  5, true, $fn=100);
                }
            }
        }
        
        /*
        //Logic Board Hump Cover Plate
        translate([-20,0,0]){
            roundedBox([case_hump_y, case_hump_x, 2],  5, true, $fn=100);
        }*/
        
    } 