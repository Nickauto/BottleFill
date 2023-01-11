module assembly_m
    use reservoir_m, only: reservoir_t
    use bottle_m, only: Bottle_t

    implicit none
    private

    public :: assembly_t

    type assembly_t
        private
        type(reservoir_t) :: reservoir
        type(Bottle_t) :: bottle
        real :: time_step
    contains
        procedure, public :: to_string
    end type

    interface
        pure module function to_string(self) result(string)
            class(assembly_t), intent(in) :: self
            character(len=450) :: string
        end function
    end interface

    interface assembly_t
        pure module function constructor(reservoir, bottle, time_step) result(assembly)
            type(reservoir_t), intent(in) :: reservoir
            type(Bottle_t), intent(in) :: bottle
            real, intent(in) :: time_step
            type(assembly_t) :: assembly
        end function
    end interface

end module


