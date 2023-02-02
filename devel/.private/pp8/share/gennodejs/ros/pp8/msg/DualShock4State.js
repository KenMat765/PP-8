// Auto-generated. Do not edit!

// (in-package pp8.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let DualShock4ButtonState = require('./DualShock4ButtonState.js');
let DualShock4HatState = require('./DualShock4HatState.js');
let DualShock4JoyStickState = require('./DualShock4JoyStickState.js');

//-----------------------------------------------------------

class DualShock4State {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.btn_state = null;
      this.hat_state = null;
      this.joy_state = null;
    }
    else {
      if (initObj.hasOwnProperty('btn_state')) {
        this.btn_state = initObj.btn_state
      }
      else {
        this.btn_state = new DualShock4ButtonState();
      }
      if (initObj.hasOwnProperty('hat_state')) {
        this.hat_state = initObj.hat_state
      }
      else {
        this.hat_state = new DualShock4HatState();
      }
      if (initObj.hasOwnProperty('joy_state')) {
        this.joy_state = initObj.joy_state
      }
      else {
        this.joy_state = new DualShock4JoyStickState();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DualShock4State
    // Serialize message field [btn_state]
    bufferOffset = DualShock4ButtonState.serialize(obj.btn_state, buffer, bufferOffset);
    // Serialize message field [hat_state]
    bufferOffset = DualShock4HatState.serialize(obj.hat_state, buffer, bufferOffset);
    // Serialize message field [joy_state]
    bufferOffset = DualShock4JoyStickState.serialize(obj.joy_state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DualShock4State
    let len;
    let data = new DualShock4State(null);
    // Deserialize message field [btn_state]
    data.btn_state = DualShock4ButtonState.deserialize(buffer, bufferOffset);
    // Deserialize message field [hat_state]
    data.hat_state = DualShock4HatState.deserialize(buffer, bufferOffset);
    // Deserialize message field [joy_state]
    data.joy_state = DualShock4JoyStickState.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 43;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pp8/DualShock4State';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '08f8aed0947cf8d575dabd0bffafc913';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #DualShock4 State message
    DualShock4ButtonState btn_state
    DualShock4HatState hat_state
    DualShock4JoyStickState joy_state
    
    ================================================================================
    MSG: pp8/DualShock4ButtonState
    # DualShock4 Button State message
    std_msgs/Bool square
    std_msgs/Bool cross
    std_msgs/Bool circle
    std_msgs/Bool triangle
    std_msgs/Bool L1
    std_msgs/Bool L2
    std_msgs/Bool R1
    std_msgs/Bool R2
    std_msgs/Bool option
    
    
    ================================================================================
    MSG: std_msgs/Bool
    bool data
    ================================================================================
    MSG: pp8/DualShock4HatState
    #DualShock4 Hat State message
    int8 hat_x
    int8 hat_y
    
    ================================================================================
    MSG: pp8/DualShock4JoyStickState
    #DualShock4 JoyStick State message
    float64 l_x
    float64 l_y
    float64 r_x
    float64 r_y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DualShock4State(null);
    if (msg.btn_state !== undefined) {
      resolved.btn_state = DualShock4ButtonState.Resolve(msg.btn_state)
    }
    else {
      resolved.btn_state = new DualShock4ButtonState()
    }

    if (msg.hat_state !== undefined) {
      resolved.hat_state = DualShock4HatState.Resolve(msg.hat_state)
    }
    else {
      resolved.hat_state = new DualShock4HatState()
    }

    if (msg.joy_state !== undefined) {
      resolved.joy_state = DualShock4JoyStickState.Resolve(msg.joy_state)
    }
    else {
      resolved.joy_state = new DualShock4JoyStickState()
    }

    return resolved;
    }
};

module.exports = DualShock4State;
