program main
  use BottleFill, only: Fill
  use Bottle_m, only: Bottle_t
  implicit none

  type(Bottle_t) :: bottle
  type(Bottle_t) :: bottle2
  
  bottle = Bottle_t(1.0)
  bottle2 = Bottle_t(1.3435)
  print *, bottle%to_string()
  print *, bottle2%to_string()
  call Fill()
  !Test
end program main
