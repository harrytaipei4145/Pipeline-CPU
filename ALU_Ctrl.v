//Subject:     CO project 2 - ALU Controller
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------


//0211229¨åå¹³ï0211261³ç¦¹


module ALU_Ctrl(
          funct_i,
          ALUOp_i,
          ALUCtrl_o
          );
          
//I/O ports 
input      [6-1:0] funct_i;
input      [4-1:0] ALUOp_i;

output     [5-1:0] ALUCtrl_o;    
     
//Internal Signals
reg        [5-1:0] ALUCtrl_o;

//Parameter
always@(*)
begin
case(ALUOp_i)
4'd0:
begin
case(funct_i)
6'd32:ALUCtrl_o<=5'd0;
6'd34:ALUCtrl_o<=5'd2;
6'd36:ALUCtrl_o<=5'd3;
6'd37:ALUCtrl_o<=5'd4;
6'd42:ALUCtrl_o<=5'd5;
6'd2:ALUCtrl_o<=5'd11;
6'd6:ALUCtrl_o<=5'd12;
6'd24:ALUCtrl_o<=5'd16;

default:
ALUCtrl_o=4'b0000;
endcase

end
4'd1:ALUCtrl_o<=5'd7;
4'd2:ALUCtrl_o<=5'd1;
4'd3:ALUCtrl_o<=5'd6;
4'd4:ALUCtrl_o<=5'd8;//BNE BNEZ
4'd5:ALUCtrl_o<=5'd9;//ORI
4'd6:ALUCtrl_o<=5'd10;//LUI
4'd7:ALUCtrl_o<=5'd13;//lw
4'd8:ALUCtrl_o<=5'd14;//sw
4'd9:ALUCtrl_o<=5'd15;//j
4'd10:ALUCtrl_o<=5'd17;//bgez
4'd11:ALUCtrl_o<=5'd18;//blt
default:
ALUCtrl_o<=5'b00000;
endcase
end
       
//Select exact operation

endmodule     





                    
                    