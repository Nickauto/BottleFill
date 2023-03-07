module orifice_m
    implicit none
    private

    public orifice_t
    
    type orifice_t
        real :: area
        integer :: left, right
    end type

    interface orifice_t
        pure module function constructor(diameter, left, right) result(orifice)
            real, intent(in) :: diameter
            integer, intent(in) :: left, right
            type(orifice_t) :: orifice
        end function
    end interface
end module

submodule(orifice_m) orifice_s
    contains
    module procedure constructor
        orifice%area = (3.1415/4) * (diameter)**2 
        orifice%left = left
        orifice%right = right
    end procedure
end submodule