# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "pp8: 4 messages, 0 services")

set(MSG_I_FLAGS "-Ipp8:/home/mech-user/pp8_ws/src/pp8/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(pp8_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4ButtonState.msg" NAME_WE)
add_custom_target(_pp8_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pp8" "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4ButtonState.msg" "std_msgs/Bool"
)

get_filename_component(_filename "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4HatState.msg" NAME_WE)
add_custom_target(_pp8_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pp8" "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4HatState.msg" ""
)

get_filename_component(_filename "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4JoyStickState.msg" NAME_WE)
add_custom_target(_pp8_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pp8" "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4JoyStickState.msg" ""
)

get_filename_component(_filename "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4State.msg" NAME_WE)
add_custom_target(_pp8_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pp8" "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4State.msg" "pp8/DualShock4ButtonState:pp8/DualShock4JoyStickState:std_msgs/Bool:pp8/DualShock4HatState"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(pp8
  "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4HatState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pp8
)
_generate_msg_cpp(pp8
  "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4State.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4ButtonState.msg;/home/mech-user/pp8_ws/src/pp8/msg/DualShock4JoyStickState.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Bool.msg;/home/mech-user/pp8_ws/src/pp8/msg/DualShock4HatState.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pp8
)
_generate_msg_cpp(pp8
  "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4JoyStickState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pp8
)
_generate_msg_cpp(pp8
  "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4ButtonState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Bool.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pp8
)

### Generating Services

### Generating Module File
_generate_module_cpp(pp8
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pp8
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(pp8_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(pp8_generate_messages pp8_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4ButtonState.msg" NAME_WE)
add_dependencies(pp8_generate_messages_cpp _pp8_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4HatState.msg" NAME_WE)
add_dependencies(pp8_generate_messages_cpp _pp8_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4JoyStickState.msg" NAME_WE)
add_dependencies(pp8_generate_messages_cpp _pp8_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4State.msg" NAME_WE)
add_dependencies(pp8_generate_messages_cpp _pp8_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pp8_gencpp)
add_dependencies(pp8_gencpp pp8_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pp8_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(pp8
  "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4HatState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pp8
)
_generate_msg_eus(pp8
  "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4State.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4ButtonState.msg;/home/mech-user/pp8_ws/src/pp8/msg/DualShock4JoyStickState.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Bool.msg;/home/mech-user/pp8_ws/src/pp8/msg/DualShock4HatState.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pp8
)
_generate_msg_eus(pp8
  "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4JoyStickState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pp8
)
_generate_msg_eus(pp8
  "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4ButtonState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Bool.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pp8
)

### Generating Services

### Generating Module File
_generate_module_eus(pp8
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pp8
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(pp8_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(pp8_generate_messages pp8_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4ButtonState.msg" NAME_WE)
add_dependencies(pp8_generate_messages_eus _pp8_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4HatState.msg" NAME_WE)
add_dependencies(pp8_generate_messages_eus _pp8_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4JoyStickState.msg" NAME_WE)
add_dependencies(pp8_generate_messages_eus _pp8_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4State.msg" NAME_WE)
add_dependencies(pp8_generate_messages_eus _pp8_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pp8_geneus)
add_dependencies(pp8_geneus pp8_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pp8_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(pp8
  "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4HatState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pp8
)
_generate_msg_lisp(pp8
  "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4State.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4ButtonState.msg;/home/mech-user/pp8_ws/src/pp8/msg/DualShock4JoyStickState.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Bool.msg;/home/mech-user/pp8_ws/src/pp8/msg/DualShock4HatState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pp8
)
_generate_msg_lisp(pp8
  "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4JoyStickState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pp8
)
_generate_msg_lisp(pp8
  "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4ButtonState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Bool.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pp8
)

### Generating Services

### Generating Module File
_generate_module_lisp(pp8
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pp8
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(pp8_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(pp8_generate_messages pp8_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4ButtonState.msg" NAME_WE)
add_dependencies(pp8_generate_messages_lisp _pp8_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4HatState.msg" NAME_WE)
add_dependencies(pp8_generate_messages_lisp _pp8_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4JoyStickState.msg" NAME_WE)
add_dependencies(pp8_generate_messages_lisp _pp8_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4State.msg" NAME_WE)
add_dependencies(pp8_generate_messages_lisp _pp8_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pp8_genlisp)
add_dependencies(pp8_genlisp pp8_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pp8_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(pp8
  "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4HatState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pp8
)
_generate_msg_nodejs(pp8
  "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4State.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4ButtonState.msg;/home/mech-user/pp8_ws/src/pp8/msg/DualShock4JoyStickState.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Bool.msg;/home/mech-user/pp8_ws/src/pp8/msg/DualShock4HatState.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pp8
)
_generate_msg_nodejs(pp8
  "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4JoyStickState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pp8
)
_generate_msg_nodejs(pp8
  "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4ButtonState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Bool.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pp8
)

### Generating Services

### Generating Module File
_generate_module_nodejs(pp8
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pp8
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(pp8_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(pp8_generate_messages pp8_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4ButtonState.msg" NAME_WE)
add_dependencies(pp8_generate_messages_nodejs _pp8_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4HatState.msg" NAME_WE)
add_dependencies(pp8_generate_messages_nodejs _pp8_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4JoyStickState.msg" NAME_WE)
add_dependencies(pp8_generate_messages_nodejs _pp8_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4State.msg" NAME_WE)
add_dependencies(pp8_generate_messages_nodejs _pp8_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pp8_gennodejs)
add_dependencies(pp8_gennodejs pp8_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pp8_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(pp8
  "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4HatState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pp8
)
_generate_msg_py(pp8
  "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4State.msg"
  "${MSG_I_FLAGS}"
  "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4ButtonState.msg;/home/mech-user/pp8_ws/src/pp8/msg/DualShock4JoyStickState.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Bool.msg;/home/mech-user/pp8_ws/src/pp8/msg/DualShock4HatState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pp8
)
_generate_msg_py(pp8
  "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4JoyStickState.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pp8
)
_generate_msg_py(pp8
  "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4ButtonState.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/std_msgs/cmake/../msg/Bool.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pp8
)

### Generating Services

### Generating Module File
_generate_module_py(pp8
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pp8
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(pp8_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(pp8_generate_messages pp8_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4ButtonState.msg" NAME_WE)
add_dependencies(pp8_generate_messages_py _pp8_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4HatState.msg" NAME_WE)
add_dependencies(pp8_generate_messages_py _pp8_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4JoyStickState.msg" NAME_WE)
add_dependencies(pp8_generate_messages_py _pp8_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/mech-user/pp8_ws/src/pp8/msg/DualShock4State.msg" NAME_WE)
add_dependencies(pp8_generate_messages_py _pp8_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pp8_genpy)
add_dependencies(pp8_genpy pp8_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pp8_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pp8)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pp8
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(pp8_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(pp8_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(pp8_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pp8)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pp8
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(pp8_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(pp8_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(pp8_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pp8)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pp8
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(pp8_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(pp8_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(pp8_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pp8)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pp8
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(pp8_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(pp8_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(pp8_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pp8)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pp8\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pp8
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(pp8_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(pp8_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(pp8_generate_messages_py sensor_msgs_generate_messages_py)
endif()
