//Subject:     CO project 2 - ALU
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


module ALU(
    src1_i,
	src2_i,
	ctrl_i,
	result_o,
	zero_o
	);
     
//I/O ports
input  [32-1:0]  src1_i;
input  [32-1:0]	 src2_i;
input  [5-1:0]   ctrl_i;

output [32-1:0]	 result_o;
output           zero_o;
reg zero_o;


//Internal signals
reg    [32-1:0]  result_o;


//Parameter
  always @( * )
  begin
  if(result_o==0)
  zero_o= 1;
  else
  zero_o=0;  
  end
  
  
  always @( * )
  begin
  case(ctrl_i)
  5'b0000: result_o<=src1_i+src2_i;

  5'b0001:result_o<=src1_i+src2_i;
  
  5'b0010: result_o<=src1_i-src2_i;

  5'b0011:result_o<=src1_i & src2_i;
 
  5'b0100:result_o<=src1_i | src2_i;

  5'b0101:
  begin
  if(src1_i<src2_i)
  result_o<=32'd1;
  else
  result_o<=32'd0;
  end
  
  
  5'b0110:
  begin
  if(src1_i<src2_i)
  result_o<=32'd1;
  else
  result_o<=32'd0;
  end
  
  5'b0111:
  begin
  if(src2_i==src1_i)
  result_o<=32'd0;
  else 
  result_o<=32'd1;
  end
  
  5'b1000:
  begin
  if(src2_i!=src1_i)
  result_o<=0;
  else 
  result_o<=32'd1;
  end
  
  5'd17:
  begin
  if(src1_i>=0)
  result_o<=0;
  else 
  result_o<=32'd1;
 end
  
  5'd18:
  begin
  if(src2_i>src1_i)
  result_o<=0;
  else 
  result_o<=32'd1;
 end
 
 
  5'd16:result_o<=src2_i*src1_i;
 

 
 
  5'b1001:result_o<=src1_i | src2_i;
 
  5'b1010:result_o<=src2_i<<16;
 
  5'b1011:result_o<=src1_i>>src2_i; 
 
  5'b1100:result_o<=src1_i>>src2_i; 
  5'd13:result_o<=src1_i+src2_i;//lw
  5'd14:result_o<=src1_i+src2_i;//sw
  5'd15:;//j
  default:result_o<=32'd0;
   
  endcase
  end





	

  
  
	





endmodule








  


                    
                    