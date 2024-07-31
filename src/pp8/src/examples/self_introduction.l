#!/usr/bin/env roseus

(ros::load-ros-manifest "roseus")
(ros::roseus "self-introduction")

(ros::advertise "/speaker" std_msgs::String 1)
(setq speaker-msg (instance std_msgs::String :init))

(ros::advertise "/servo/arm_ang" std_msgs::Float32MultiArray 1)
(setq arm-msg (instance std_msgs::Float32MultiArray :init))

(ros::advertise "/left_arm/switch" std_msgs::Bool 1)
(setq left-switch-msg (instance std_msgs::Bool :init))

(ros::advertise "/right_arm/switch" std_msgs::Bool 1)
(setq right-switch-msg (instance std_msgs::Bool :init))

(unix::sleep 1)

(send left-switch-msg :data nil)
(send right-switch-msg :data nil)
(ros::publish "/left_arm/switch" left-switch-msg)
(ros::publish "/right_arm/switch" right-switch-msg)

(send speaker-msg :data "konnnichiwa.")
(ros::publish "/speaker" speaker-msg)
(send arm-msg :data #f(90 0))
(ros::publish "/servo/arm_ang" arm-msg)

(unix::sleep 1)

(send arm-msg :data #f(0 0))
(ros::publish "/servo/arm_ang" arm-msg)

(unix::sleep 2)

(send speaker-msg :data "watashinonamaeha,pi'-pi'-eito.")
(ros::publish "/speaker" speaker-msg)

(unix::sleep 4)

(send speaker-msg :data "a-muwotousaisita,kyuutai'robottode_su.")
(ros::publish "/speaker" speaker-msg)

(unix::sleep 4)

(send speaker-msg :data "nihonngona'ra,shabe'rukotoga+dekima_su.")
(ros::publish "/speaker" speaker-msg)

(unix::sleep 4)

(send arm-msg :data #f(0 90))
(ros::publish "/servo/arm_ang" arm-msg)
(send speaker-msg :data "watashino/ude'wa konoyo'-ni jiyu-ni+ugoka'sukotoga'dekima_su")
(ros::publish "/speaker" speaker-msg)

(unix::sleep 1)

(send arm-msg :data #f(90 90))
(ros::publish "/servo/arm_ang" arm-msg)

(unix::sleep 1)

(send arm-msg :data #f(0 0))
(ros::publish "/servo/arm_ang" arm-msg)

(unix::sleep 4)

(send speaker-msg :data "a-muni'wa,kyorise'nnsa-ga/tsu'iteirunode.")
(ros::publish "/speaker" speaker-msg)

(unix::sleep 4)

(send arm-msg :data #f(0 90))
(ros::publish "/servo/arm_ang" arm-msg)
(send speaker-msg :data "zennpo-no;sho-ga'ibutsuo,ninnshikisurukoto'ga+dekima_su.")
(ros::publish "/speaker" speaker-msg)

(unix::sleep 1)

(send arm-msg :data #f(0 0))
(ros::publish "/servo/arm_ang" arm-msg)

(unix::sleep 4)

(send speaker-msg :data "i'makara,sho-ga'ibutsuo+yokena'gara/ugokimawa'ru/demonnsutore'-shonno+oko'naima_su")
(ros::publish "/speaker" speaker-msg)

(ros::exit)
