
(cl:in-package :asdf)

(defsystem "pp8-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "DualShock4ButtonState" :depends-on ("_package_DualShock4ButtonState"))
    (:file "_package_DualShock4ButtonState" :depends-on ("_package"))
    (:file "DualShock4HatState" :depends-on ("_package_DualShock4HatState"))
    (:file "_package_DualShock4HatState" :depends-on ("_package"))
    (:file "DualShock4JoyStickState" :depends-on ("_package_DualShock4JoyStickState"))
    (:file "_package_DualShock4JoyStickState" :depends-on ("_package"))
    (:file "DualShock4State" :depends-on ("_package_DualShock4State"))
    (:file "_package_DualShock4State" :depends-on ("_package"))
    (:file "PP8_Status" :depends-on ("_package_PP8_Status"))
    (:file "_package_PP8_Status" :depends-on ("_package"))
  ))