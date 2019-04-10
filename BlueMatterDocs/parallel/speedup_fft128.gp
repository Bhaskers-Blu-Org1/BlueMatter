reset
clock=700e6
ideal(x)=x

set size .9, .9
# set size 1.2, 1.2
set origin .1, .1
set lmargin 8
set rmargin 8
set bmargin 2
set tmargin 1
#set key 17000,1300
#set key graph .25, .95
set key bottom left
#set xrange [*:20000]
#set yrange [0:1]
set xlabel "Node Count"
set ylabel "Speedup relative to Single Node"
set logscale xy
plot 'fft_bgl.128' using 1:($6*$1/$7) title 'estimated speedup' with lines,\
'fft_bgl.128' using 1:1 title 'ideal speedup' with lines

