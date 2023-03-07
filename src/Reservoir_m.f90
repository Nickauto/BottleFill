module reservoir_m
    implicit none
    private

    public reservoir_t
    public test_t

    type test_t
        real :: test_v
    end type

    type reservoir_t
        !Reservoir Conditions
        real,public :: P_0
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
        procedure, public :: get_P_0
        
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
            character(len=250) :: string
        end function
   end interface    


contains
    pure function get_P_0(self) result(P_0)
        class(reservoir_t), intent(in) :: self
        real :: P_0
        P_0 = self%P_0
    end function

    pure function get_Pcrit(self) result(Pcrit)
        class(reservoir_t), intent(in) :: self
        real :: Pcrit
        Pcrit = self%Pcrit
    end function


end module

