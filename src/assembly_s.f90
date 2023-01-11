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