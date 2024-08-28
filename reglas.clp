(deftemplate cliente
    (slot nombre)
    (slot presupuesto (type NUMBER))
    (slot tipo-viaje (type SYMBOL) 
        (allowed-symbols aventura cultura relajación gastronomía ecoturismo))
    (slot preferencia (type SYMBOL) 
        (allowed-symbols playa montaña ciudad selva desierto))
)

(deftemplate salida
    (slot mensaje)
)

;; Regla 1: Relajación en la playa
(defrule recomendar-playa-relajacion
    (cliente (nombre ?nombre) (presupuesto ?presupuesto&:(< ?presupuesto 3000)) (tipo-viaje relajación) (preferencia playa))
    =>
    (assert (salida (mensaje (str-cat "Recomendación para " ?nombre ": Viaje a una playa exótica con un presupuesto de hasta " ?presupuesto "."))))
)

;; Regla 2: Aventura en la montaña
(defrule recomendar-montaña-aventura
    (cliente (nombre ?nombre) (presupuesto ?presupuesto&:(> ?presupuesto 3000)) (tipo-viaje aventura) (preferencia montaña))
    =>
    (assert (salida (mensaje (str-cat "Recomendación para " ?nombre ": Excursión a la montaña con actividades de aventura, con un presupuesto superior a " ?presupuesto "."))))
)

;; Regla 3: Cultura en la ciudad
(defrule recomendar-ciudad-cultura
    (cliente (nombre ?nombre) (presupuesto ?presupuesto) (tipo-viaje cultura) (preferencia ciudad))
    =>
    (assert (salida (mensaje (str-cat "Recomendación para " ?nombre ": Tour cultural por las ciudades más históricas con un presupuesto de hasta " ?presupuesto "."))))
)

;; Regla 4: Gastronomía en la ciudad
(defrule recomendar-ciudad-gastronomia
    (cliente (nombre ?nombre) (presupuesto ?presupuesto) (tipo-viaje gastronomía) (preferencia ciudad))
    =>
    (assert (salida (mensaje (str-cat "Recomendación para " ?nombre ": Tour gastronómico en las ciudades con un presupuesto de hasta " ?presupuesto "."))))
)

;; Regla 5: Relajación en la montaña
(defrule recomendar-montaña-relajacion
    (cliente (nombre ?nombre) (presupuesto ?presupuesto) (tipo-viaje relajación) (preferencia montaña))
    =>
    (assert (salida (mensaje (str-cat "Recomendación para " ?nombre ": Retiro de relajación en la montaña con un presupuesto de hasta " ?presupuesto "."))))
)

;; Regla 6: Ecoturismo en la selva
(defrule recomendar-selva-ecoturismo
    (cliente (nombre ?nombre) (presupuesto ?presupuesto&:(> ?presupuesto 5000)) (tipo-viaje ecoturismo) (preferencia selva))
    =>
    (assert (salida (mensaje (str-cat "Recomendación para " ?nombre ": Ecoturismo en la selva con actividades de conservación, con un presupuesto superior a " ?presupuesto "."))))
)

;; Regla 7: Aventura en el desierto
(defrule recomendar-desierto-aventura
    (cliente (nombre ?nombre) (presupuesto ?presupuesto&:(< ?presupuesto 2000)) (tipo-viaje aventura) (preferencia desierto))
    =>
    (assert (salida (mensaje (str-cat "Recomendación para " ?nombre ": Safari de aventura en el desierto con un presupuesto de hasta " ?presupuesto "."))))
)

;; Regla 8: Cultura en la selva
(defrule recomendar-selva-cultura
    (cliente (nombre ?nombre) (presupuesto ?presupuesto) (tipo-viaje cultura) (preferencia selva))
    =>
    (assert (salida (mensaje (str-cat "Recomendación para " ?nombre ": Exploración cultural de tribus en la selva con un presupuesto de hasta " ?presupuesto "."))))
)

;; Regla 9: Ecoturismo en la montaña
(defrule recomendar-montaña-ecoturismo
    (cliente (nombre ?nombre) (presupuesto ?presupuesto&:(< ?presupuesto 4000)) (tipo-viaje ecoturismo) (preferencia montaña))
    =>
    (assert (salida (mensaje (str-cat "Recomendación para " ?nombre ": Turismo ecológico en la montaña con un presupuesto de hasta " ?presupuesto "."))))
)

;; Regla 10: Relajación en el desierto
(defrule recomendar-desierto-relajacion
    (cliente (nombre ?nombre) (presupuesto ?presupuesto) (tipo-viaje relajación) (preferencia desierto))
    =>
    (assert (salida (mensaje (str-cat "Recomendación para " ?nombre ": Retiro de relajación en el desierto con un presupuesto de hasta " ?presupuesto "."))))
)

;; Regla 11: Aventura en la selva
(defrule recomendar-selva-aventura
    (cliente (nombre ?nombre) (presupuesto ?presupuesto&:(> ?presupuesto 6000)) (tipo-viaje aventura) (preferencia selva))
    =>
    (assert (salida (mensaje (str-cat "Recomendación para " ?nombre ": Expedición de aventura en la selva con un presupuesto superior a " ?presupuesto "."))))
)

;; Regla 12: Gastronomía en la playa
(defrule recomendar-playa-gastronomia
    (cliente (nombre ?nombre) (presupuesto ?presupuesto) (tipo-viaje gastronomía) (preferencia playa))
    =>
    (assert (salida (mensaje (str-cat "Recomendación para " ?nombre ": Experiencia culinaria en resorts de playa con un presupuesto de hasta " ?presupuesto "."))))
)

;; Regla 13: Cultura en el desierto
(defrule recomendar-desierto-cultura
    (cliente (nombre ?nombre) (presupuesto ?presupuesto&:(< ?presupuesto 2500)) (tipo-viaje cultura) (preferencia desierto))
    =>
    (assert (salida (mensaje (str-cat "Recomendación para " ?nombre ": Tour cultural en oasis del desierto con un presupuesto de hasta " ?presupuesto "."))))
)

;; Regla 14: Ecoturismo en el desierto
(defrule recomendar-desierto-ecoturismo
    (cliente (nombre ?nombre) (presupuesto ?presupuesto&:(> ?presupuesto 4500)) (tipo-viaje ecoturismo) (preferencia desierto))
    =>
    (assert (salida (mensaje (str-cat "Recomendación para " ?nombre ": Ecoturismo en el desierto con actividades de conservación, con un presupuesto superior a " ?presupuesto "."))))
)

;; Regla 15: Gastronomía en la montaña
(defrule recomendar-montaña-gastronomia
    (cliente (nombre ?nombre) (presupuesto ?presupuesto) (tipo-viaje gastronomía) (preferencia montaña))
    =>
    (assert (salida (mensaje (str-cat "Recomendación para " ?nombre ": Experiencia gastronómica en refugios de montaña con un presupuesto de hasta " ?presupuesto "."))))
)
