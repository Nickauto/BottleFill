submodule(Bottle_m) Bottle_s
contains
    module procedure constructor
        real :: radius_

        radius_ = ((3.0 / (4.0*3.1415)) * volume) ** (1.0/3.0)
        Bottle%volume = volume 
        Bottle%radius = radius_
    end procedure

    pure function to_string(self) result(string)
        class(Bottle_t), intent(in) :: self
        character(len=150) :: string
        
        write(string,1) new_line("C"), self%volume, new_line("C"),self%radius
        1 format("Bottle_t: ", A1,&
            "   Volume = ", f10.2, A1,&
            "   Radius = ", f10.2)
    end function


end submodule