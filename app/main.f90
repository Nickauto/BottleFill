program main
  use Reservoir_m, only: reservoir_t, test_t
  use orifice_m, only: orifice_t
  use Bottle_m, only: Bottle_t
  use assembly_m, only: assembly_t
  use gas_m, only: gas_t
  implicit none

  type(Bottle_t) :: bottle_up
  type(Bottle_t) :: bottle_down
  type(reservoir_t) :: reservoir
  type(reservoir_t) :: reservoir2
  type(assembly_t) :: assembly
  type(test_t) :: test
  type(gas_t) :: gas
  type(orifice_t) :: orifice



    !Reservoir Conditions
  real :: P_0 = 5000000.0  !Pa
  real :: T_0 = 300.0      !K
  real :: mw = 40.0       !kg/kmol
  real :: Cp = 1000.0       !J/kg-K
  real :: orifice_diameter = 0.005  !m
  real, parameter :: Ru = 8314.0     !J/kmol

 
  gas = gas_t(Cp, Ru, mw)
  orifice = orifice_t(orifice_diameter, 1, 2)

  bottle_up = Bottle_t(1.0, P_0, T_0, gas, 1)
  bottle_down = Bottle_t(1.0, P_0, T_0, gas, 2)

 
  assembly = assembly_t(bottle_up, bottle_down, 0.1, orifice)
  print *, gas%cp
  print *, assembly%bottle_up%gas%cp
  print *, assembly%bottle_up%gas%cp
  print *, assembly%bottle_up%gas%mw
  print *, assembly%bottle_up%gas%R_g
  assembly%get_Pcrit()
end program main
