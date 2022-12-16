submodule(Reservoir_m) Reservoir_s
    implicit none
contains
    module procedure constructor
        reservoir%P_0 = P_0
        reservoir%T_0 = T_0
        reservoir%mw = mw
        reservoir%gamma = gamma
        reservoir%d_orifice = d_orifice
        reservoir%Ru = Ru

        reservoir%Pcrit = (2.0 / (reservoir%gamma + 1.0)) &
            **(reservoir%gamma / (reservoir%gamma - 1.0))
        reservoir%A = (3.1415/4.0) * reservoir%d_orifice**2
        reservoir%rho_0 = reservoir%P_0 * (reservoir%mw/reservoir%Ru) * (1.0/reservoir%T_0)
        reservoir%Cp = (reservoir%gamma*(reservoir%Ru/reservoir%mw)) / (reservoir%gamma - 1.0)
        reservoir%Cv = reservoir%Cp - (reservoir%Ru/reservoir%mw)

        reservoir%c_star = sqrt((1.0/reservoir%gamma)*(((reservoir%gamma + 1.0)/2.0) &
            **((reservoir%gamma+1.0)/(reservoir%gamma-1.0)))*reservoir%Ru &
            *(reservoir%T_0/reservoir%mw))
        reservoir%mdot_Choked = (reservoir%P_0*reservoir%A) / reservoir%c_star
    end procedure

    pure function to_string(self) result(string)
        class(reservoir_t), intent(in) :: self
        character(len=250) :: string

        write(string,1) new_line("C"), self%P_0/10**6, &
            new_line("C"), self%d_orifice*1000, &
            new_line("C"), self%c_star, &
            new_line("C"), self%mdot_choked, &
            new_line("C"), self%T_0
        1 format("Resevoir_t: ", A1,&
            "   P_0 (MPa)          = ", f10.2, A1, &
            "   d_orifice (mm)     = ", f10.2, A1, &
            "   c_star             = ", f10.2, A1, &
            "   mdot_choked (kg/s) = ", f10.2, A1, &
            "   T_0 (K)            = ", f10.2)
    end function   
end submodule