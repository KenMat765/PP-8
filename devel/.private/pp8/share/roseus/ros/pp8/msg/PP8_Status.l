;; Auto-generated. Do not edit!


(when (boundp 'pp8::PP8_Status)
  (if (not (find-package "PP8"))
    (make-package "PP8"))
  (shadow 'PP8_Status (find-package "PP8")))
(unless (find-package "PP8::PP8_STATUS")
  (make-package "PP8::PP8_STATUS"))

(in-package "ROS")
;;//! \htmlinclude PP8_Status.msg.html


(defclass pp8::PP8_Status
  :super ros::object
  :slots (_max_vel _max_pos ))

(defmethod pp8::PP8_Status
  (:init
   (&key
    ((:max_vel __max_vel) 0)
    ((:max_pos __max_pos) 0)
    )
   (send-super :init)
   (setq _max_vel (round __max_vel))
   (setq _max_pos (round __max_pos))
   self)
  (:max_vel
   (&optional __max_vel)
   (if __max_vel (setq _max_vel __max_vel)) _max_vel)
  (:max_pos
   (&optional __max_pos)
   (if __max_pos (setq _max_pos __max_pos)) _max_pos)
  (:serialization-length
   ()
   (+
    ;; uint16 _max_vel
    2
    ;; uint16 _max_pos
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16 _max_vel
       (write-word _max_vel s)
     ;; uint16 _max_pos
       (write-word _max_pos s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16 _max_vel
     (setq _max_vel (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _max_pos
     (setq _max_pos (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get pp8::PP8_Status :md5sum-) "6cca4ef09711a7f41b34ac1b1e5c99e2")
(setf (get pp8::PP8_Status :datatype-) "pp8/PP8_Status")
(setf (get pp8::PP8_Status :definition-)
      "# PP8 Status message
uint16 max_vel
uint16 max_pos

")



(provide :pp8/PP8_Status "6cca4ef09711a7f41b34ac1b1e5c99e2")


