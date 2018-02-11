//Subject:     CO project 2 - Decoder
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Decoder(
    instr_op_i,
	RegWrite_o,
	ALU_op_o,
	ALUSrc_o,
	RegDst_o,
	Branch_o,
	Jump_o,
	MemRead_o,
	MemWrite_o,
	MemtoReg_o,
	);
     
//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;
output [4-1:0] ALU_op_o;
output         ALUSrc_o;
output         RegDst_o;
output         Branch_o;
output         Jump_o;
output	      MemRead_o;
output	      MemWrite_o;
output         MemtoReg_o; 

//Internal Signals
reg    [4-1:0] ALU_op_o;
reg            ALUSrc_o;
reg            RegWrite_o;
reg            RegDst_o;
reg            Branch_o;
reg            Jump_o;
reg	         MemRead_o;
reg	         MemWrite_o;
reg	         MemtoReg_o; 


//Parameter



always @ (*)
    begin
        
		  
        case (instr_op_i)        //R-type Instructions
            0:begin
            	ALU_op_o<=4'd0;
            	ALUSrc_o<=0;
            	Branch_o<=0;
            	RegDst_o<=1'b1;
            	RegWrite_o<=1'b1;
            	Jump_o<=1;
	            MemRead_o<=0;
	            MemWrite_o<=0;
	            MemtoReg_o<=0;
					
              end
				  
				 1:begin
            	ALU_op_o<=4'd10;
            	ALUSrc_o<=0;
            	Branch_o<=1;
            	RegDst_o<=1'b1;
            	RegWrite_o<=1'b1;
            	Jump_o<=1;
	            MemRead_o<=0;
	            MemWrite_o<=0;
	            MemtoReg_o<=1;
					
              end  

            6'd4:begin
	            ALU_op_o<=4'd1;
	            ALUSrc_o<=1'd0;
	            Branch_o<=1'd1;
	            RegDst_o<=0;
	            RegWrite_o<=0;
	            Jump_o<=1;
	            MemRead_o<=0;
	            MemWrite_o<=0;
	            MemtoReg_o<=1;
					
	          end
				 
				 6'd5:begin
				
	            ALU_op_o<=4'd4;
	            ALUSrc_o<=1'd0;
	            Branch_o<=1;
	            RegDst_o<=1'b0;
	            RegWrite_o<=1'b0;
	            Jump_o<=1;
	            MemRead_o<=0;
	            MemWrite_o<=0;
	            MemtoReg_o<=1; 
					
               end
					
					
				 6'd6:begin
				
	            ALU_op_o<=4'd11;
	            ALUSrc_o<=1'd0;
	            Branch_o<=1;
	            RegDst_o<=1'b0;
	            RegWrite_o<=1'b0;
	            Jump_o<=1;
	            MemRead_o<=0;
	            MemWrite_o<=0;
	            MemtoReg_o<=1; 
					
               end

            6'd8:begin
	            ALU_op_o<=4'd2;
	            ALUSrc_o<=1'd1;
	            Branch_o<=0;
	            RegDst_o<=1'b0;
	            RegWrite_o<=1'b1;
	            Jump_o<=1;
	            MemRead_o<=0;
	            MemWrite_o<=0;
	            MemtoReg_o<=0; 
					
              end
           
            6'd10:begin
				
	            ALU_op_o<=4'd3;
	            ALUSrc_o<=1'd1;
	            Branch_o<=0;
	            RegDst_o<=1'b0;
	            RegWrite_o<=1'b0;
	            Jump_o<=1;
	            MemRead_o<=0;
	            MemWrite_o<=0;
	            MemtoReg_o<=1;
										
               end
        
            
				6'd13:begin
				
	            ALU_op_o<=4'd5;
	            ALUSrc_o<=1'd1;
	            Branch_o<=0;
	            RegDst_o<=1'b0;
	            RegWrite_o<=1'b0;
	            Jump_o<=1;
	            MemRead_o<=0;
	            MemWrite_o<=0;
	            MemtoReg_o<=1; 
					
               end
            6'd15:begin
				
	            ALU_op_o<=4'd6;
	            ALUSrc_o<=1'd1;
	            Branch_o<=0;
	            RegDst_o<=1'b0;
	            RegWrite_o<=1'b0;
	            Jump_o<=1;
	            MemRead_o<=0;
	            MemWrite_o<=0;
	            MemtoReg_o<=1; 
						
               end
            6'b100011:begin//LW
				
	            ALU_op_o<=4'd7;
	            ALUSrc_o<=1'b1;
	            Branch_o<=0;
	            RegDst_o<=0;
	            RegWrite_o<=1'b1;
	            Jump_o<=1;
	            MemRead_o<=1;
	            MemWrite_o<=0;
	            MemtoReg_o<=0; 
					
               end
            6'b101011:begin//SW
				
	            ALU_op_o<=4'd8;
	            ALUSrc_o<=1'b1;
	            Branch_o<=0;
	            RegDst_o<=0;
	            RegWrite_o<=0;
	            Jump_o<=1;
	            MemRead_o<=0;
	            MemWrite_o<=1'd1;
	            MemtoReg_o<=1; 
					
               end
            6'b000010:begin//J
				
	            ALU_op_o<=4'd9;
	            ALUSrc_o<=0;
	            Branch_o<=0;
	            RegDst_o<=0;
	            RegWrite_o<=0;
	            Jump_o<=0;
	            MemRead_o<=0;
	            MemWrite_o<=0;
	            MemtoReg_o<=1; 
						
               end
					
					
		

            
            default:
               begin
	            	ALU_op_o<=0;
	            	ALUSrc_o<=0;
	            	Branch_o<=0;
	            	RegDst_o<=0;
	            	RegWrite_o<=0;
	            	Jump_o<=1;
	            	MemRead_o<=0;
	            	MemWrite_o<=0;
	            	MemtoReg_o<=1; 
              end
        endcase
    end // end of DECODE



//Main function

endmodule





                    
                    