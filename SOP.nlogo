;; Simulacion basada en el articulo:
;; SOP Model

;; 13 de Marzo del 2015
;; Jose Manuel Proudinat Silva


turtles-own [ quality standing ]
globals [ totalStanding neighStand ]


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to setup
  
  ;; Sentamos a las personas en el auditorio
  
  clear-all
  
  set neighStand 0
  
  create-turtles 1000[
    setxy random-pxcor random-pycor
    set color blue
    set shape "square"
    set quality random-float 1
    set standing 0
    if ( count turtles-here > 1)
      [ moves turtle who ]
  ]
  
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to moves[turt]

  ;; Esta funcion mueve las tortugas para no 
  ;; permiten que se encimen

  setxy random-pxcor random-pycor
  if ( count turtles-here > 1 )
    [ moves turt ]

end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to stand-up
  
  ;; Se ponen de pie de acuerdo al modelo SOP
  
  ;; Incialmente se ponen de pie
  
  ask turtles[
    if ( quality > threshold)
      [ set standing 1 
        set color yellow
      ]
  ] 
  
end
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
to influence
  
  ;; Las personas se paran si sus 4 vecinos mas cercanos 
  ;; estan parados
  
  ;; Modificar a que solo cuenten los que estan delante
  
  ask turtles[
    set neighStand ( count ( turtles-on neighbors4 ) with [ standing = 1 ] )
    if (neighStand > (count ( turtles-on neighbors4 )) / 2)
      [ set standing 1
        set color yellow
      ]
  ]
  
end    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

