//Subject:     CO project 4 - Pipe CPU 1
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
module Pipe_CPU_1(
        clk_i,
		rst_i
		);
    
/****************************************
I/O ports
****************************************/
input clk_i;
input rst_i;

/****************************************
Internal signal
****************************************/
wire clk_i;
wire rst_i;
wire [31:0] pc_in_i,pc_in_i_2;

wire [31:0] pc_out_o;
wire [31:0] instr_o;
wire RegWrite_o,RegWrite_oo,RegWrite_ooo,RegWrite_oooo;
wire [3:0] ALU_op_o,ALU_op_oo;
wire ALUSrc_o,ALUSrc_oo ; 
wire RegDst_o,RegDst_oo ;  
wire Branch_o,Branch_oo,Branch_ooo ;
wire [4:0] Mux_Write_Reg_o,Mux_Write_Reg_ooo,Mux_Write_Reg_oooo;
wire Mux_PC_Source_1;
wire [31:0] RSdata_o,RSdata_oo;
wire [31:0] RTdata_o,RTdata_oo,RTdata_ooo;
wire [31:0] SE_o,SE_oo;
wire [31:0] Mux_ALUSrc_o;
wire [4:0] ALUCtrl_o;
wire zero_o,zero_ooo;
wire [31:0] ALU_o,ALU_ooo,ALU_oooo;
wire [31:0] Shifter_o;
wire [31:0] Adder_1_o;
wire [31:0] Adder_2_o,Adder_2_ooo;

wire [31:0] readdata_o,readdata_oooo;
wire Jump_o,Jump_oo;
wire MemRead_o,MemRead_oo,MemRead_ooo;
wire MemWrite_o,MemWrite_oo,MemWrite_ooo;
wire MemtoReg_o,MemtoReg_oo,MemtoReg_ooo,MemtoReg_oooo;
wire [63:0]if_id;
wire [31:0]Mux_3to1_o;
wire [31:0]id_ex_add;
wire [4:0]id_ex_2016,id_ex_1511;
wire pcsrc;
/**** IF stage ****/


/**** ID stage ****/

//control signal


/**** EX stage ****/

//control signal


/**** MEM stage ****/

//control signal


/**** WB stage ****/

//control signal


/****************************************
Instnatiate modules
****************************************/
//Instantiate the components in IF stage

ProgramCounter PC(
	    .clk_i(clk_i),      
	    .rst_i (rst_i),     
	    .pc_in_i(pc_in_i_2) ,   
	    .pc_out_o(pc_out_o) 

        );

Instruction_Memory IM(
        .addr_i(pc_out_o),  
	    .instr_o(instr_o)
	    );
			
Adder Add_pc(
        .src1_i(32'd4),     
	    .src2_i(pc_out_o),     
	    .sum_o(Adder_1_o)  
		);

		
Pipe_Reg #(.size(64)) IF_ID(       //N is the total length of input/output    
    .rst_i(rst_i),
	.clk_i(clk_i),
	.data_i({Adder_1_o, instr_o}),
	.data_o(if_id)
		);
		
//Instantiate the components in ID stage
Reg_File RF(
        .clk_i(clk_i),      
	    .rst_i(rst_i) ,     
        .RSaddr_i(if_id[25:21]) ,  
        .RTaddr_i(if_id[20:16]) ,  
        .RDaddr_i(Mux_Write_Reg_oooo) ,  
        .RDdata_i(Mux_3to1_o)  , 
        .RegWrite_i (RegWrite_oooo),
        .RSdata_o(RSdata_o) , 
        .RTdata_o(RTdata_o)
		);

Decoder Control(
		.instr_op_i(if_id[31:26]), 
	    .RegWrite_o(RegWrite_o), 
	    .ALU_op_o(ALU_op_o),   
	    .ALUSrc_o(ALUSrc_o),   
	    .RegDst_o(RegDst_o),   
		.Branch_o(Branch_o),
		.Jump_o(Jump_o),
		.MemRead_o(MemRead_o),
		.MemWrite_o(MemWrite_o),
		.MemtoReg_o(MemtoReg_o)
		);

Sign_Extend Sign_Extend(
        .data_i(if_id[15:0]),
        .data_o(SE_o)
		);	

Pipe_Reg #(.size(150)) ID_EX(
	    .rst_i(rst_i),
		.clk_i(clk_i),   
		.data_i({RegWrite_o,MemtoReg_o,Branch_o,MemWrite_o,MemRead_o,ALUSrc_o,ALU_op_o,RegDst_o,Jump_o,if_id[63:32],RSdata_o,RTdata_o,SE_o,if_id[20:16],if_id[15:11]}),
		.data_o({RegWrite_oo,MemtoReg_oo,Branch_oo,MemWrite_oo,MemRead_oo,ALUSrc_oo,ALU_op_oo,RegDst_oo,Jump_oo,id_ex_add,RSdata_oo,RTdata_oo,SE_oo,id_ex_2016,id_ex_1511})

		);
		
//Instantiate the components in EX stage	   
ALU ALU(
        .src1_i(RSdata_oo),
	    .src2_i(Mux_ALUSrc_o),
	    .ctrl_i(ALUCtrl_o),
	    .result_o(ALU_o),
		.zero_o(zero_o)
		);
		
ALU_Ctrl ALU_Control(
        .funct_i(SE_oo[5:0]),   
        .ALUOp_i(ALU_op_oo),   
        .ALUCtrl_o(ALUCtrl_o)
		);

MUX_2to1 #(.size(32)) Mux1(
        .data0_i(RTdata_oo),
        .data1_i(SE_oo),
        .select_i(ALUSrc_oo),
        .data_o(Mux_ALUSrc_o)
        );
		
MUX_2to1 #(.size(5)) Mux2(
        .data0_i(id_ex_2016),
        .data1_i(id_ex_1511),
        .select_i(RegDst_oo),
        .data_o(Mux_Write_Reg_o)
        );
Shift_Left_Two_32 Shifter(
        .data_i(SE_oo),
        .data_o(Shifter_o)
        ); 		

Pipe_Reg #(.size(107)) EX_MEM(
	    .rst_i(rst_i),
		.clk_i(clk_i), 
        .data_i({RegWrite_oo,MemtoReg_oo,Branch_oo,MemWrite_oo,MemRead_oo,Adder_2_o,zero_o,ALU_o,RTdata_oo,Mux_Write_Reg_o}),
        .data_o({RegWrite_ooo,MemtoReg_ooo,Branch_ooo,MemWrite_ooo,MemRead_ooo,Adder_2_ooo,zero_ooo,ALU_ooo,RTdata_ooo,Mux_Write_Reg_ooo})
		);
Adder Adder2(
        .src1_i(id_ex_add),     
	    .src2_i(Shifter_o),     
	    .sum_o(Adder_2_o)      
	    );		   
MUX_2to1 #(.size(32)) Mux3(
        .data0_i(Adder_1_o),
        .data1_i(Adder_2_ooo),
        .select_i(pcsrc),
        .data_o(pc_in_i_2)
        );
//Instantiate the components in MEM stage
Data_Memory DM

(
	.clk_i(clk_i),
	.addr_i(ALU_ooo),
	.data_i(RTdata_ooo),
	.MemRead_i(MemRead_ooo),
	.MemWrite_i(MemWrite_ooo),
	.data_o(readdata_o)
);

Pipe_Reg #(.size(71)) MEM_WB(
        .rst_i(rst_i),
		.clk_i(clk_i), 
        .data_i({RegWrite_ooo,MemtoReg_ooo,ALU_ooo,readdata_o,Mux_Write_Reg_ooo}),
        .data_o({RegWrite_oooo,MemtoReg_oooo,ALU_oooo,readdata_oooo,Mux_Write_Reg_oooo})
		);
and AND_1(pcsrc,Branch_ooo,zero_ooo);	
//Instantiate the components in WB stage
MUX_2to1 #(.size(32)) Mux4(
        .data0_i(ALU_oooo),
        .data1_i(readdata_oooo),
        .select_i(MemtoReg_oooo),
        .data_o(Mux_3to1_o)
        );

		  


/****************************************
signal assignment
****************************************/	
endmodule

