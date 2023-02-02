// Auto-generated. Do not edit!

// (in-package pp8.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class DualShock4JoyStickState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.l_x = null;
      this.l_y = null;
      this.r_x = null;
      this.r_y = null;
    }
    else {
      if (initObj.hasOwnProperty('l_x')) {
        this.l_x = initObj.l_x
      }
      else {
        this.l_x = 0.0;
      }
      if (initObj.hasOwnProperty('l_y')) {
        this.l_y = initObj.l_y
      }
      else {
        this.l_y = 0.0;
      }
      if (initObj.hasOwnProperty('r_x')) {
        this.r_x = initObj.r_x
      }
      else {
        this.r_x = 0.0;
      }
      if (initObj.hasOwnProperty('r_y')) {
        this.r_y = initObj.r_y
      }
      else {
        this.r_y = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DualShock4JoyStickState
    // Serialize message field [l_x]
    bufferOffset = _serializer.float64(obj.l_x, buffer, bufferOffset);
    // Serialize message field [l_y]
    bufferOffset = _serializer.float64(obj.l_y, buffer, bufferOffset);
    // Serialize message field [r_x]
    bufferOffset = _serializer.float64(obj.r_x, buffer, bufferOffset);
    // Serialize message field [r_y]
    bufferOffset = _serializer.float64(obj.r_y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DualShock4JoyStickState
    let len;
    let data = new DualShock4JoyStickState(null);
    // Deserialize message field [l_x]
    data.l_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [l_y]
    data.l_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [r_x]
    data.r_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [r_y]
    data.r_y = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pp8/DualShock4JoyStickState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd1dc4bb1b4a2956e5a2e9cdf4c2d8004';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new DualShock4JoyStickState(null);
    if (msg.l_x !== undefined) {
      resolved.l_x = msg.l_x;
    }
    else {
      resolved.l_x = 0.0
    }

    if (msg.l_y !== undefined) {
      resolved.l_y = msg.l_y;
    }
    else {
      resolved.l_y = 0.0
    }

    if (msg.r_x !== undefined) {
      resolved.r_x = msg.r_x;
    }
    else {
      resolved.r_x = 0.0
    }

    if (msg.r_y !== undefined) {
      resolved.r_y = msg.r_y;
    }
    else {
      resolved.r_y = 0.0
    }

    return resolved;
    }
};

module.exports = DualShock4JoyStickState;
