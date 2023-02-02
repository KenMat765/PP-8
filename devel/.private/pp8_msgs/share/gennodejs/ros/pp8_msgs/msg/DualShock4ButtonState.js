// Auto-generated. Do not edit!

// (in-package pp8_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class DualShock4ButtonState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.square = null;
      this.cross = null;
      this.circle = null;
      this.triangle = null;
      this.L1 = null;
      this.L2 = null;
      this.R1 = null;
      this.R2 = null;
      this.option = null;
    }
    else {
      if (initObj.hasOwnProperty('square')) {
        this.square = initObj.square
      }
      else {
        this.square = new std_msgs.msg.Bool();
      }
      if (initObj.hasOwnProperty('cross')) {
        this.cross = initObj.cross
      }
      else {
        this.cross = new std_msgs.msg.Bool();
      }
      if (initObj.hasOwnProperty('circle')) {
        this.circle = initObj.circle
      }
      else {
        this.circle = new std_msgs.msg.Bool();
      }
      if (initObj.hasOwnProperty('triangle')) {
        this.triangle = initObj.triangle
      }
      else {
        this.triangle = new std_msgs.msg.Bool();
      }
      if (initObj.hasOwnProperty('L1')) {
        this.L1 = initObj.L1
      }
      else {
        this.L1 = new std_msgs.msg.Bool();
      }
      if (initObj.hasOwnProperty('L2')) {
        this.L2 = initObj.L2
      }
      else {
        this.L2 = new std_msgs.msg.Bool();
      }
      if (initObj.hasOwnProperty('R1')) {
        this.R1 = initObj.R1
      }
      else {
        this.R1 = new std_msgs.msg.Bool();
      }
      if (initObj.hasOwnProperty('R2')) {
        this.R2 = initObj.R2
      }
      else {
        this.R2 = new std_msgs.msg.Bool();
      }
      if (initObj.hasOwnProperty('option')) {
        this.option = initObj.option
      }
      else {
        this.option = new std_msgs.msg.Bool();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DualShock4ButtonState
    // Serialize message field [square]
    bufferOffset = std_msgs.msg.Bool.serialize(obj.square, buffer, bufferOffset);
    // Serialize message field [cross]
    bufferOffset = std_msgs.msg.Bool.serialize(obj.cross, buffer, bufferOffset);
    // Serialize message field [circle]
    bufferOffset = std_msgs.msg.Bool.serialize(obj.circle, buffer, bufferOffset);
    // Serialize message field [triangle]
    bufferOffset = std_msgs.msg.Bool.serialize(obj.triangle, buffer, bufferOffset);
    // Serialize message field [L1]
    bufferOffset = std_msgs.msg.Bool.serialize(obj.L1, buffer, bufferOffset);
    // Serialize message field [L2]
    bufferOffset = std_msgs.msg.Bool.serialize(obj.L2, buffer, bufferOffset);
    // Serialize message field [R1]
    bufferOffset = std_msgs.msg.Bool.serialize(obj.R1, buffer, bufferOffset);
    // Serialize message field [R2]
    bufferOffset = std_msgs.msg.Bool.serialize(obj.R2, buffer, bufferOffset);
    // Serialize message field [option]
    bufferOffset = std_msgs.msg.Bool.serialize(obj.option, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DualShock4ButtonState
    let len;
    let data = new DualShock4ButtonState(null);
    // Deserialize message field [square]
    data.square = std_msgs.msg.Bool.deserialize(buffer, bufferOffset);
    // Deserialize message field [cross]
    data.cross = std_msgs.msg.Bool.deserialize(buffer, bufferOffset);
    // Deserialize message field [circle]
    data.circle = std_msgs.msg.Bool.deserialize(buffer, bufferOffset);
    // Deserialize message field [triangle]
    data.triangle = std_msgs.msg.Bool.deserialize(buffer, bufferOffset);
    // Deserialize message field [L1]
    data.L1 = std_msgs.msg.Bool.deserialize(buffer, bufferOffset);
    // Deserialize message field [L2]
    data.L2 = std_msgs.msg.Bool.deserialize(buffer, bufferOffset);
    // Deserialize message field [R1]
    data.R1 = std_msgs.msg.Bool.deserialize(buffer, bufferOffset);
    // Deserialize message field [R2]
    data.R2 = std_msgs.msg.Bool.deserialize(buffer, bufferOffset);
    // Deserialize message field [option]
    data.option = std_msgs.msg.Bool.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pp8_msgs/DualShock4ButtonState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0c13d9931152581a8101d288caaba285';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #DualShock4 Button State message
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DualShock4ButtonState(null);
    if (msg.square !== undefined) {
      resolved.square = std_msgs.msg.Bool.Resolve(msg.square)
    }
    else {
      resolved.square = new std_msgs.msg.Bool()
    }

    if (msg.cross !== undefined) {
      resolved.cross = std_msgs.msg.Bool.Resolve(msg.cross)
    }
    else {
      resolved.cross = new std_msgs.msg.Bool()
    }

    if (msg.circle !== undefined) {
      resolved.circle = std_msgs.msg.Bool.Resolve(msg.circle)
    }
    else {
      resolved.circle = new std_msgs.msg.Bool()
    }

    if (msg.triangle !== undefined) {
      resolved.triangle = std_msgs.msg.Bool.Resolve(msg.triangle)
    }
    else {
      resolved.triangle = new std_msgs.msg.Bool()
    }

    if (msg.L1 !== undefined) {
      resolved.L1 = std_msgs.msg.Bool.Resolve(msg.L1)
    }
    else {
      resolved.L1 = new std_msgs.msg.Bool()
    }

    if (msg.L2 !== undefined) {
      resolved.L2 = std_msgs.msg.Bool.Resolve(msg.L2)
    }
    else {
      resolved.L2 = new std_msgs.msg.Bool()
    }

    if (msg.R1 !== undefined) {
      resolved.R1 = std_msgs.msg.Bool.Resolve(msg.R1)
    }
    else {
      resolved.R1 = new std_msgs.msg.Bool()
    }

    if (msg.R2 !== undefined) {
      resolved.R2 = std_msgs.msg.Bool.Resolve(msg.R2)
    }
    else {
      resolved.R2 = new std_msgs.msg.Bool()
    }

    if (msg.option !== undefined) {
      resolved.option = std_msgs.msg.Bool.Resolve(msg.option)
    }
    else {
      resolved.option = new std_msgs.msg.Bool()
    }

    return resolved;
    }
};

module.exports = DualShock4ButtonState;
