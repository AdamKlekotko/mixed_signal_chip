v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 20 -20 40 -20 {
lab=I}
N 20 -20 20 80 {
lab=I}
N 20 80 40 80 {
lab=I}
N 0 30 20 30 {
lab=I}
N 80 10 80 50 {
lab=xxx}
N 80 30 160 30 {
lab=xxx}
N 80 110 80 130 {
lab=VSS}
N 80 -70 80 -50 {
lab=VDD}
C {sky130_fd_pr/pfet3_01v8_lvt.sym} 60 -20 0 0 {name=M2
L=0.15
W=1
body=VDD
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet3_01v8_lvt.sym} 60 80 2 1 {name=M3
L=0.15
W=1
nf=1
mult=1
body=GND
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {devices/ipin.sym} 0 30 0 0 {name=p1 lab=I

}
C {devices/ipin.sym} 80 -70 0 0 {name=p2 lab=VDD
}
C {devices/ipin.sym} 80 130 0 0 {name=p3 lab=VSS
}
C {devices/opin.sym} 160 30 0 0 {name=p4 lab=Y

}
