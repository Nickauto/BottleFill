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
    contains
        procedure, public :: to_string
    end type

    interface reservoir_t
        module procedure constructor
    end interface

   
contains
    pure function constructor(P_0, T_0, mw, gamma, d_orifice, Ru) result(reservoir)
        type(reservoir_t) :: reservoir
        real, intent(in) :: P_0, T_0, mw, gamma, d_orifice, Ru
        reservoir%P_0 = P_0
        reservoir%T_0 = T_0
        reservoir%mw = mw
        reservoir%gamma = gamma
        reservoir%d_orifice = d_orifice
        reservoir%Ru = Ru

        reservoir%Pcrit = (2.0 / (reservoir%gamma + 1.0)) &
            **(reservoir%gamma / (reservoir%gamma - 1.0))
        reservoir%A = (3.1415/4.0) * reservoir%d_orifice**2
        reservoir%rho_0 = reservoir%P_0 * (reservoir%mw/reservoir%Ru) * (1.0/reservoir%T_0)
        reservoir%Cp = (reservoir%gamma*(reservoir%Ru/reservoir%mw)) / (reservoir%gamma - 1.0)
        reservoir%Cv = reservoir%Cp - (reservoir%Ru/reservoir%mw)
    end function
    
    pure function to_string(self) result(string)
        class(reservoir_t), intent(in) :: self
        character(len=150) :: string

        write(string,1) new_line("C"), self%P_0/1000000, new_line("C"),self%d_orifice*10**3
        1 format("Resevoir_t: ", A1,&
            "   P_0 (MPa)        = ", f10.2, A1,&
            "   d_orifice (mm^2) = ", f10.2)
    end function        
        
end module