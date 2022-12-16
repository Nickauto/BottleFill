clear
clc
mclose("all")
data = fscanfMat("C:\Fortran\BottleFill\data")

Time = data(:,1)
Pressure = data(:,2)
Temp = data(:,3)
mdot = data(:,4)
edot = data(:,5)
qdot = data(:,6)

scf(1)
subplot(2,2,1)
title("Bottle Pressure")
xlabel("Pressure (MPa)")
ylabel("Time (sec)")
plot(Time,Pressure)
ax = gca()
ax.data_bounds = [0 0; 500 6]
xgrid

subplot(2,2,2)
title("Bottle Temperature")
xlabel("Time (sec)")
ylabel("Temperature (K)")
plot(Time, Temp)
ax2 = gca()
ax2.data_bounds = [0 0; 500 600]
xgrid

subplot(2,2,3)
title("Mass Flow Rate")
xlabel("Time (sec)")
ylabel("Mass Flow Rate (kg/s)")
plot(Time, mdot)
ax2 = gca()
ax2.data_bounds = [0 0; 500 1.6]
xgrid

subplot(2,2,4)
title("Energy Flow Rate")
xlabel("Time (sec)")
ylabel("Enerjy Flow Rate (J/s)")
plot(Time, edot)
ax2 = gca()
ax2.data_bounds = [0 0; 500 200000]
xgrid

scf(2)
title("Heat Loss To Isothermal Wall")
xlabel("Time (sec)")
ylabel("Enerjy Flow Rate (J/s)")
plot(Time, qdot)
ax2 = gca()
ax2.data_bounds = [0 0; 500 1000]
xgrid
