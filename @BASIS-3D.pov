// bluatigro 2 apr 2018
// @basis_3d : 3d engine

#declare limmax = 200 ; 
#declare leftno = 0 ; 
#declare rightno = limmax / 2 ;
#declare sk = array[ limmax ][ 3 ]
#declare i = 0 ;
#while ( i < limmax )  
  #declare j = 0 ;
  #while ( j < 3 ) 
    #declare sk[ i ][ j ] = 0 ;
    #declare j = j + 1 ;
  #end
  #declare i = i + 1 ;
#end
#declare xyz = 0 ;
#declare xzy = 1 ;
#declare yxz = 2 ;
#declare yzx = 3 ;
#declare zxy = 4 ;
#declare zyx = 6 ;

#macro link( a , b , c , pan , tilt , rol , q )
  #switch( q )
    #case( xyz )
      rotate < tilt , 0 , 0 >
      rotate < 0 , pan , 0 >
      rotate < 0 , 0 , rol >
    #break
    #case( xzy )
      rotate < tilt , 0 , 0 >
      rotate < 0 , 0 , rol >
      rotate < 0 , pan ,  >  
    #break
    #case( yxz )
      rotate < tilt , 0 , 0 >
      rotate < 0 , pan , 0 >
      rotate < 0 , 0 , rol >
    #break
    #case( yzx )
      rotate < 0 , pan , 0 >
      rotate < 0 , 0 , rol >
      rotate < tilt , 0 , 0 >
    #break
    #case( zxy )
      rotate < 0 , 0 , rol >
      rotate < tilt , 0 , 0 >
      rotate < 0 , pan , 0 >
    #break
    #case( zyx )
      rotate < 0 , 0 , rol >
      rotate < 0 , pan , 0 >
      rotate < tilt , 0 , 0 >
    #break
    #else
    #break
  #end
  translate < a , b , c >  
#end                   

#macro child( a , b , c , lim , p )  
  #if ( ( 0 <= lim ) & ( lim < limmax ) )
    link( a , b , c , 
      sk[ lim ][ 1 ] , 
      sk[ lim ][ 0 ] , 
      sk[ lim ][ 2 ] , p )
  #end
#end    

#macro setangle( lim , a , b , c )  
  #if ( lim < 0 )
    #declare lim = limmax - lim ;
  #end  
  #if ( 0 <= lim )
    #declare sk[ lim ][ 0 ] = a ;
    #declare sk[ lim ][ 1 ] = b ;
    #declare sk[ lim ][ 2 ] = c ;
  #end
#end                                          

#macro pendel( fase , amp )
  sin( radians( fase ) ) * amp
#end

#macro pend( lim , ax , fase , amp , add ) 
  #if ( lim < 0 )
    #declare lim = limmax - lim ;
  #end                                    
  #if ( ( 0 <= lim ) & ( lim < limmax ) 
      & ( 0 <= ax ) & ( ax <= 2 ) )
    #declare sk[ lim ][ ax ] = 
       pendel( fase , amp ) + add ;
  #end
#end

#declare thumb = 1 ;
#declare index = 4 ;
#declare middle = 7 ;
#declare ring = 10 ;
#declare pink = 13 ;

#declare body   = 20 ;
#declare leg   = 21 ;
#declare knee   = 22 ;
#declare enkle  = 23 ;
#declare arm    = 24 ;
#declare elbow = 25 ;
#declare wrist   = 26 ;
#declare neck    = 27 ;
#declare eye    = 28 ;
#declare lid    = 29 ;
#declare wenk   = 30 ;
#declare mouth   = 31 ;
#declare tail = 32 ;

#declare ibody = 1 ;
#declare ileg = 2 ;
#declare iknee = 7 ;
#declare itail = 12 ;
#declare iarm = 13 ;
#declare ielbow = 14 ;
#declare iwrist = 15 ;
#declare ifinger = 16 ;
#declare ieye = 17 ;
#declare ilid = 18 ;
#declare ineck = 19 ;
#declare itail = 20 ;   
#declare iwing = 21 ;

#macro half( q , s )
  difference {
    sphere { 
      0 , 1 
    }
    box { 
      < -1 , 0 , -1 > , < 1 , 1 , 1 > 
    }  
    scale s
    rotate q
  }
#end 
