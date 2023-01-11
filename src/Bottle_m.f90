module bottle_m
    implicit none
    private

    public Bottle_t

    type Bottle_t
        private
        real :: volume
        real :: radius
        real :: m = 0
        real :: E = 0
        real :: P_b = 0
        real :: T_b = 0
        real :: rho_b = 0
        real :: c
        real :: T_static
    contains
        procedure, public :: to_string
    end type

    interface Bottle_t
        pure module function constructor(volume) result(Bottle)
            real, intent(in) :: volume
            type(Bottle_t) :: Bottle
        end function 
    end interface

    interface
        pure module function to_string(self) result(string)
            class(Bottle_t), intent(in) :: self
            character(len=150) :: string
        end function
        
    end interface
end module

