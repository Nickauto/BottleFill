submodule(assembly_m) assembly_s
    implicit none

contains
    pure function to_string(self) result(string)
        class(assembly_t), intent(in) :: self
        character(len=450) :: string

        write(string, 1) new_line("C"), self%time_step, new_line("C"),&
            new_line("C"), self%bottle_up%to_string(), &
            new_line("C"), new_line("C"), self%bottle_down%to_string()
        1 format("---assembly_t--- ", A1, "Time Step (s): ", f10.2, &
            A1, A1, A250, A1,A1, A150)
    end function

    module procedure constructor
        assembly%bottle_up = bottle_up
        assembly%bottle_down = bottle_down
        assembly%orifice = orifice
        assembly%time_step = time_step
    end procedure

    module procedure checkChoked
       ! if ((self%bottle%P_b/self%reservoir%P_0) < self%reservoir%Pcrit) then
           ! self%choked = .true.
       ! else
            !self%choked = .false.
       ! end if
    end procedure

    module procedure runCalc
        !Pcrit = self%get_Pcrit()   
    end procedure

    module procedure get_Pcrit
        !associate(g => self%bottle_up%gas%gamma)
        Pcrit = (2 / (self%bottle_up%gas%gamma + 1)) ** (self%bottle_up%gas%gamma / (self%bottle_up%gas%gamma - 1))
        !end associate
    end procedure


end submodule