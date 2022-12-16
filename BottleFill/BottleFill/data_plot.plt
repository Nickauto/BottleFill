set xlabel "Time (s)"
set ylabel "Pressure (MPa)"
m="./data"
set terminal wxt size 650,400 enhanced font 'Verdana,10' persist
set nokey
set grid
set title 'Transient Bottle Pressure'
plot m using 1:2 with linespoints
