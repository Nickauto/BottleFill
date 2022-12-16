program main
  use Reservoir_m, only: reservoir_t
  use Bottle_m, only: Bottle_t
  implicit none

  type(Bottle_t) :: bottle
  type(Bottle_t) :: bottle2
  type(reservoir_t) :: reservoir

    !Reservoir Conditions
  real :: P_0 = 5000000.0  !Pa
  real :: T_0 = 300.0      !K
  real :: mw = 40.0       !kg/kmol
  real :: gamma = 1.67
  real :: d_orifice = 0.005  !m
  real :: Ru = 8314.0     !J/kmol

  reservoir = Reservoir_t(P_0, T_0, mw, gamma, d_orifice, Ru)
  bottle = Bottle_t(1.0)
  bottle2 = Bottle_t(1.3435)
  print *, bottle%to_string()
  print *, bottle2%to_string()
  print *, reservoir%to_string()
  !call Fill()
  !Test
end program main
