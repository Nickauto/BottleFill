module gas_m
    implicit none
    private

    public gas_t


    type gas_t
        real :: gamma, R_g, mw, cv, cp
    end type

    interface gas_t
        pure module function constructor(Cp, Ru, mw) result(gas)
            real, intent(in) :: Cp
            real, intent(in) :: Ru
            real, intent(in) :: mw
            type(gas_t) :: gas
        end function
    end interface

end module

submodule(gas_m) gas_s
    contains
    module procedure constructor
        gas%Cp = Cp 
        gas%R_g = Ru/mw
        gas%mw = mw
        gas%cv = Cp - gas%R_g
        gas%gamma = Cp/gas%cv
    end procedure
end submodule