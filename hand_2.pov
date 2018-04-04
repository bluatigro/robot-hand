// bluatigro 2 apr 2018
// hand_2

#include "colors.inc"
#include "@BASIS-3D.pov"

camera {
  location < 0 , 0 , -10 >
  look_at 0
}                               
light_source {
  < -100 , 100 , -100 >
  ( Cyan + White ) / 2
}
light_source {
  < 100 , 100 , -100 >
  ( Yellow + White ) / 2
}
light_source {
  < 0 , -100 , -100 >
  ( Magenta + White ) / 2
}
background { White * .7 }    
#declare hoek = clock * 360 ;
#macro vinger_einde( kl )
// finger end part
  difference {
    merge {
      box { < -2 , -1.5 , -1.5 > , < 2 , 1.5 , 1.5 > }
      cylinder { < -2 , -1.5 , 0 > , < -2 , 1.5 , 0 > , 1.5 }
      cylinder { < 2 , -1.5 , 0 > , < 2 , 1.5 , 0 > , 1.5 }
      box { < 1.9 , -1.5 , 0 > , <  3.5 , 1.5 , 1.5 > }
    }
    box { < .5 , .5 , -2 > , < 4 , 2 , 2 > }
    box { < .5 , -.5 , -2 > , < 4 , -2 , 2 > }
    cylinder { < 2 , -2 , 0 > , < 2 , 2 , 0 > , .4 }
    pigment { kl }
  }
#end

#macro vinger_deel( kl )
// finger between part
  difference {
    merge {
      box { < -2 , -1.5 , -1.5 > , < 2 , 1.5 , 1.5 > }
      cylinder { < -2 , -1.5 , 0 > , < -2 , 1.5 , 0 > , 1.5 }
      cylinder { < 2 , -1.5 , 0 > , < 2 , 1.5 , 0 > , 1.5 }
      box { < -3.5 , -1.49 , 0 > , <  3.5 , 1.49 , 1.5 > }
    }
    box { < .5 , .5 , -2 > , < 4 , 2 , 2 > }
    box { < .5 , -.5 , -2 > , < 4 , -2 , 2 > }
    box { < -.5 , -.5 , -2 > , < -4 , .5 , 2 > }
    cylinder { < 2 , -2 , 0 > , < 2 , 2 , 0 > , .4 }
    cylinder { < -2 , -2 , 0 > , < -2 , 2 , 0 > , .4 }
    cylinder { < -2 , -2 , 0 > , < -2 , -.8 , 0 > , 1 }
    cylinder { < -2 , 2 , 0 > , < -2 , .8 , 0 > , 1 } 
    pigment { kl }
  }
#end              

#macro hand_palm( kl )
// hand main part                                    
merge {
  difference {
    merge {
      box { < 0 , -6 , -1.5 > , < 10 , 6 , 1.5 > }
      cylinder { < 0 , -6 , 0 > , < 0 , 6 , 0 > , 1.5 }
      box { < -1.5 , -6 , 0 > , < 0 , 6 , 1.5 > }
    }
    box { < -2 , 4 , -2 > , < 1.5 , 5 , 2 > }                             
    box { < -2 , 1 , -2 > , < 1.5 , 2 , 2 > } 
    box { < -2 , -1 , -2 > , < 1.5 , -2 , 2 > }
    box { < -2 , -4 , -2 > , < 1.5 , -5 , 2 > }
    cylinder { < 0 , -7 , 0 > , < 0 , 7 , 0 > , .4 }
    cylinder { < 0 , -7 , 0 > , < 0 , -5.25 , 0 > , 1 }
    cylinder { < 0 , 6 , 0 > , < 0 , 5.25 , 0 > , 1 }
  }
  difference {
    merge {
      cylinder { < 5 , 7.5 , -3 > , < 8 , 7.5 , -3 > , 1.5 }
      cylinder { < 5.5 , 0 , 0 > , < 5.5 , 7.5 , -3 > , 1.5 }
      cylinder { < 7.5 , 0 , 0 > , < 7.5 , 7.5 , -3 > , 1.5 }
    }    
    cylinder { < 0 , 7.5 , -3 > , < 10 , 7.5 , -3 > , .4 }
    cylinder { < 6 , 7.5 , -3 > , < 7 , 7.5 , -3 > , 4 } 
    cylinder { < 1 , 7.5 , -3 > , < 5.5 , 7.5 , -3 > , 1 }
    cylinder { < 10 , 7.5 , -3 > , < 7.5 , 7.5 , -3 > , 1 }
  }                    
  pigment { kl }
}
#end                                               


#macro hand_muis( kl )
// thumb begin part
  merge {
    difference {
      merge {
        box { < 3 , -1.5 , 1.5 > , < 7 , 1.5 , 4.5 > }
        cylinder { < 4 , 0 , -1.5 > , < 5 , 0 , -1.5 > , 1.5 } 
        box { < 4 , -1.5 , -1.5 > , < 5 , 1.5 , 1.5 > }
        box { < 1 , -1.5 , 3 > , < 3 , 1.5 , 4.5 > }
        cylinder { < 2.5 , -1.5 , 3 > , < 2.5 , 1.5 , 3 > , 1.5 }
      }
      cylinder { < 1 , 0 , -1.5 > , < 5 , 0 , -1.5 > , .4 }
      box { < 1 , -.5 , -2 > , < 3.5 , .5 , 2 > }
      cylinder { < 2.5 , -2 , 3 > , < 2.5 , 2 , 3 > , .4 }
      cylinder { < 2.5 , 2 , 3 > , < 2.5 , .75 , 3 > , 1 }
      cylinder { < 2.5 , -2 , 3 > , < 2.5 , -.75 , 3 > , 1 }
    }             
    pigment { kl }
  }
#end

#macro vinger( lim )
// finger asembled
  merge {
    vinger_deel( ( Yellow + White ) / 2 )
    merge {
      vinger_deel( ( Yellow + White ) / 2 )
      merge {
        vinger_einde( ( Magenta + White ) / 2 )
        child( -4 , 0 , 0 , lim + 2 , xyz )
      }
      child( -4 , 0 , 0 , lim + 1 , xyz )
    }
  }
#end

#macro hand_2()   
// hole right hand                  
  merge {
    hand_palm( White )                        
    merge {
      hand_muis( ( Cyan + White ) / 2 )
      merge {
        vinger_deel( ( Yellow + White ) / 2 )                                
        merge {
          vinger_einde( ( Magenta + White ) / 2 )
          child( -4 , 0 , 0 , rightno + thumb + 2 , xyz )
        }
        child( 0 , 0 , 3 , rightno + thumb + 1 , xyz ) 
      }
      child( 2 , 7.5 , -1.5 , rightno + thumb , xyz )
    }
    merge { 
      vinger( rightno + index )
      child( -2 , 4.5 , 0 , rightno + index , xyz )
    }
    merge {
      vinger( rightno + middle )
      child( -2 , 1.5 , 0 , rightno + middle , xyz ) 
    }
    merge {
      vinger( rightno + ring )
      child( -2 , -1.5 , 0 , rightno + ring , xyz ) 
    }
    merge {
      vinger( rightno + pink )
      child( -2 , -4.5 , 0 , rightno + pink , xyz ) 
    }
  }
#end
