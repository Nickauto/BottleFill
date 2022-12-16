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


submodule(assembly_m) assembly_s
    implicit none

contains
    pure function to_string(self) result(string)
        class(assembly_t), intent(in) :: self
        character(len=450) :: string

        write(string, 1) new_line("C"), self%time_step, new_line("C"),&
            new_line("C"), self%reservoir%to_string(), &
            new_line("C"), new_line("C"), self%bottle%to_string()
        1 format("---assembly_t--- ", A1, "Time Step (s): ", f10.2, &
            A1, A1, A250, A1,A1, A150)
    end function

    module procedure constructor
        assembly%bottle = bottle
        assembly%reservoir = reservoir
        assembly%time_step = time_step
    end procedure


end submodule