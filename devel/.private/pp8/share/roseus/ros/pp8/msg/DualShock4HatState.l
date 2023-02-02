;; Auto-generated. Do not edit!


(when (boundp 'pp8::DualShock4HatState)
  (if (not (find-package "PP8"))
    (make-package "PP8"))
  (shadow 'DualShock4HatState (find-package "PP8")))
(unless (find-package "PP8::DUALSHOCK4HATSTATE")
  (make-package "PP8::DUALSHOCK4HATSTATE"))

(in-package "ROS")
;;//! \htmlinclude DualShock4HatState.msg.html


(defclass pp8::DualShock4HatState
  :super ros::object
  :slots (_hat_x _hat_y ))

(defmethod pp8::DualShock4HatState
  (:init
   (&key
    ((:hat_x __hat_x) 0)
    ((:hat_y __hat_y) 0)
    )
   (send-super :init)
   (setq _hat_x (round __hat_x))
   (setq _hat_y (round __hat_y))
   self)
  (:hat_x
   (&optional __hat_x)
   (if __hat_x (setq _hat_x __hat_x)) _hat_x)
  (:hat_y
   (&optional __hat_y)
   (if __hat_y (setq _hat_y __hat_y)) _hat_y)
  (:serialization-length
   ()
   (+
    ;; int8 _hat_x
    1
    ;; int8 _hat_y
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _hat_x
       (write-byte _hat_x s)
     ;; int8 _hat_y
       (write-byte _hat_y s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _hat_x
     (setq _hat_x (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _hat_x 127) (setq _hat_x (- _hat_x 256)))
   ;; int8 _hat_y
     (setq _hat_y (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _hat_y 127) (setq _hat_y (- _hat_y 256)))
   ;;
   self)
  )

(setf (get pp8::DualShock4HatState :md5sum-) "3e853de77a9549fef8a730a59484d6a2")
(setf (get pp8::DualShock4HatState :datatype-) "pp8/DualShock4HatState")
(setf (get pp8::DualShock4HatState :definition-)
      "#DualShock4 Hat State message
int8 hat_x
int8 hat_y

")



(provide :pp8/DualShock4HatState "3e853de77a9549fef8a730a59484d6a2")


