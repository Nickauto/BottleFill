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
        module procedure constructor
    end interface


contains
    pure function constructor(volume) result(Bottle)
        real, intent(in) :: volume
        type(Bottle_t) :: Bottle
        real :: radius_

        radius_ = ((3.0 / (4.0*3.1415)) * volume) ** (1.0/3.0)
        Bottle%volume = volume 
        Bottle%radius = radius_
    end function

    pure function to_string(self) result(string)
        class(Bottle_t), intent(in) :: self
        character(len=150) :: string
        
        write(string,1) new_line("C"), self%volume, new_line("C"),self%radius
        1 format("Bottle_t: ", A1,&
            "   Volume = ", f10.2, A1,&
            "   Radius = ", f10.2)
    end function


end module