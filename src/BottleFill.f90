module BottleFill
  implicit none
  private

  !Reservoir Conditions
  real, parameter :: P_0 = 5000000.0  !Pa
  real, parameter :: T_0 = 300.0      !K
  real, parameter :: mw = 40.0       !kg/kmol
  real, parameter :: gamma = 1.67
  real, parameter :: d_orifice = 0.005  !m
  real, parameter :: Ru = 8314.0     !J/kmol
  real, parameter :: Pcrit = (2.0 / (gamma + 1.0))**(gamma / (gamma - 1.0))
  real, parameter :: A = (3.1415/4.0) * d_orifice**2
  real, parameter :: rho_0 = P_0 * (mw/Ru) * (1.0/T_0)
  real, parameter :: Cp = (gamma*(Ru/mw)) / (gamma - 1.0)
  real, parameter :: Cv = Cp - (Ru/mw)




  !Heat Transfer Variables
  !real :: heat_A = (3.0*volume) / radius
  real :: dQ = 0
  real, parameter :: h = 10  !W/m^2-K
  real, parameter :: T_Wall = 300

  !Other Program Variables
  real :: cstar
  real :: mdot_Choked
  real :: mdot_unchoked
  real :: Mach
  real :: mdot
  real :: edot
  real :: dt = 0.1 ! seconds
  integer, parameter :: timesteps = 5000
  real, dimension(timesteps,6) :: output
  integer :: i
  real :: Time = 0
  integer :: unit
  logical :: was_choked = .TRUE.

  public :: Fill
contains
  subroutine Fill()
    ! Set Initial Bottle Conditions
    output(1,:) = [0.0, 0.0, T_0, 0.0, 0.0, 0.0]

    do i = 2, timesteps
      if ((P_b/P_0) < Pcrit) then 
        cstar = sqrt((1.0/gamma)*(((gamma + 1.0)/2.0)**((gamma+1.0)/(gamma-1.0)))*Ru*(T_0/mw))
        mdot_Choked = (P_0*A) / cstar

        mdot = mdot_Choked
      else
        if (was_choked .eqv. .TRUE.) then
          print *, "The Flow Unchoked At: ", Time, "seconds"
          print *, "The pressure in the bottle is: ", P_b/1000000, "MPa)"
          was_choked = .FALSE.
        end if

        Mach = sqrt((2.0/(gamma-1.0))*((P_0/P_b)**((gamma-1.0)/gamma)-1.0))
        T_static = T_0 / (1.0 + ((gamma-1.0)/2.0)*Mach**2.0)
        rho_b =   rho_0 / (1.0 + ((gamma-1.0)/2.0)*Mach**2.0)**(1.0/(gamma-1.0))
        c = sqrt(gamma * (Ru/mw) * T_static)
        mdot_unchoked = rho_b * (Mach * c) * A
        mdot = mdot_unchoked
        !print *, "Unchoked at T = ", Time, "s"
        !print *, "Mach # = ", Mach
      end if
      
      edot = mdot * Cp * T_0
      m = m + mdot*dt
      E = E + edot*dt
      ! Heat loss calculation 
      !dQ = h*heat_A*(T_b-T_Wall)*dt
      E = E - dQ


      T_b = E / (m * Cv)

      

      P_b = (m/volume) * (Ru/mw) * T_b
      if (P_b > P_0) then
        P_b = P_0
      end if
      output(i,:) = [Time, P_b, T_b, mdot, edot, dQ]
      Time = Time + dt
    end do

    open(newunit=unit, file='data')
    do i = 1,timesteps
      write(unit, *) output(i,1), output(i,2)/1000000, output(i,3), output(i,4), output(i,5), output(i,6)
    end do
    close(unit)

    CALL SYSTEM ('gnuplot -p data_plot.plt')
    
  end subroutine Fill
end module BottleFill
