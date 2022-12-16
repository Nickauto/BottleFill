module reservoir_m
    implicit none
    private

    public reservoir_t

    type reservoir_t
        private
        !Reservoir Conditions
        real :: P_0 
        real :: T_0 
        real :: mw 
        real :: gamma 
        real :: d_orifice 
        real :: Ru 
        real :: Pcrit 
        real :: A 
        real :: rho_0 
        real :: Cp 
        real :: Cv 
        real :: c_star
        real :: mdot_choked
    contains
        procedure, public :: to_string
    end type

    interface reservoir_t
        pure module function constructor(P_0, T_0, mw, gamma, d_orifice, Ru) result(reservoir)
            type(reservoir_t) :: reservoir
            real, intent(in) :: P_0, T_0, mw, gamma, d_orifice, Ru
        end function
    end interface

    interface
        pure module function to_string(self) result(string)
            class(reservoir_t), intent(in) :: self
            character(len=200) :: string
        end function
   end interface    
end module

