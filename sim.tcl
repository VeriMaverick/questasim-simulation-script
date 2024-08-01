# Project name: SystemVerilog lab4
# File name:    sim.tcl
# Description:  questasim simulation script
# Date:         2024/08/01
# E-mail:       wangmingjieic@outlook.com

# Set run file
set RUN_FILE tb

# Set path
set SIM_DIR ./
set RTL_DIR ../rtl

# Set the UVM_DPI_HOME environment variable to the location of the UVM DPI shared library.
# Linux System/Windows System 
#set UVM_DPI_HOME    /home/mentor/questasim/uvm-1.2/linux_x86_64
set UVM_DPI_HOME    C:/questasim64_2020.1/uvm-1.1d/win64

# Create the Project lib 
if [file exists "work"] {vdel -all}
vlib work

# Compilation library and Compile file list
vlog -L mtiAvm -L mtiOvm -L mtiUvm -L mtiUPF    \
${SIM_DIR}/arb_pkg.sv       \
${SIM_DIR}/chnl_pkg.sv      \
${SIM_DIR}/rpt_pkg.sv       \
${SIM_DIR}/fmt_pkg.sv       \
${SIM_DIR}/reg_pkg.sv       \
${SIM_DIR}/mcdf_pkg.sv      \
${SIM_DIR}/${RUN_FILE}.sv   \
${RTL_DIR}/param_def.v      \
${RTL_DIR}/arbiter.v        \
${RTL_DIR}/formater.v       \
${RTL_DIR}/reg.v            \
${RTL_DIR}/slave_fifo.v     \
${RTL_DIR}/mcdf.v           \

# Start Simulation
vsim -c -sv_lib $UVM_DPI_HOME/uvm_dpi work.${RUN_FILE}
vsim -voptargs=+acc work.${RUN_FILE}
add wave -position insertpoint sim:/${RUN_FILE}/*
run -all
#qiut -sim