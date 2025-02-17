v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -190 -20 -110 -20 {
lab=in}
N -190 -20 -190 -10 {
lab=in}
N 190 -40 230 -40 {
lab=OUT}
C {/home/ttuser/work/mixed_signal_chip/xschem/inverter.sym} 40 -20 0 0 {name=x1}
C {devices/gnd.sym} -260 10 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} -260 -20 0 0 {name=V1 value=3 savecurrent=false}
C {devices/vdd.sym} -260 -50 0 0 {name=l2 lab=VDD}
C {devices/vdd.sym} -110 -40 0 0 {name=l3 lab=VDD}
C {devices/vsource.sym} -260 -20 0 0 {name=V2 value=3 savecurrent=false}
C {devices/gnd.sym} -190 50 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} -190 20 0 0 {name=V3 value="sin 0.9 0.9 10Meg" savecurrent=false}
C {devices/vsource.sym} -190 20 0 0 {name=V4 value=3 savecurrent=false}
C {devices/gnd.sym} -110 0 0 0 {name=l5 lab=GND}
C {devices/noconn.sym} 230 -40 0 1 {name=l6}
C {devices/lab_wire.sym} 220 -40 0 0 {name=p1 sig_type=std_logic lab=OUT
}
C {devices/lab_wire.sym} -150 -20 0 0 {name=p2 sig_type=std_logic lab=in
}
C {sky130_fd_pr/corner.sym} -400 80 0 0 {name=CORNER only_toplevel=false corner=tt}
C {devices/code_shown.sym} -240 140 0 0 {name=s1 only_toplevel=false value="test
"}
