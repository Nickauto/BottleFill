module assembly_m
    use bottle_m, only: Bottle_t
    use orifice_m, only: orifice_t

    implicit none
    private

    public :: assembly_t

    type assembly_t
        type(Bottle_t) :: bottle_up
        type(Bottle_t) :: bottle_down
        type(orifice_t) :: orifice
        real :: time_step
        logical :: choked = .false.
        integer :: timesteps = 100
        real, dimension(100,6) :: output
    contains
        procedure, public :: to_string
        procedure, public :: runCalc
        procedure, public :: checkChoked
        procedure, public :: get_Pcrit
    end type

    interface
        pure module function to_string(self) result(string)
            class(assembly_t), intent(in) :: self
            character(len=450) :: string
        end function

       module function checkChoked(self)
            class(assembly_t), intent(inout) :: self
       end function

       module function runCalc(self)
            class(assembly_t), intent(inout) :: self
       end function 

       module function get_Pcrit(self) result(Pcrit)
            class(assembly_t), intent(in) :: self
            real :: Pcrit
        end function

    end interface

    interface assembly_t
        pure module function constructor(bottle_up, bottle_down, time_step, orifice) result(assembly)
            type(Bottle_t), intent(in) :: bottle_up, bottle_down
            type(orifice_t), intent(in) :: orifice
            real, intent(in) :: time_step
            type(assembly_t) :: assembly
        end function
    end interface


contains
    
    


end module


