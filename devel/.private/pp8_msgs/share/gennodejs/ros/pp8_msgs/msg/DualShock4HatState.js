// Auto-generated. Do not edit!

// (in-package pp8_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class DualShock4HatState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.hat_x = null;
      this.hat_y = null;
    }
    else {
      if (initObj.hasOwnProperty('hat_x')) {
        this.hat_x = initObj.hat_x
      }
      else {
        this.hat_x = 0;
      }
      if (initObj.hasOwnProperty('hat_y')) {
        this.hat_y = initObj.hat_y
      }
      else {
        this.hat_y = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DualShock4HatState
    // Serialize message field [hat_x]
    bufferOffset = _serializer.int8(obj.hat_x, buffer, bufferOffset);
    // Serialize message field [hat_y]
    bufferOffset = _serializer.int8(obj.hat_y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DualShock4HatState
    let len;
    let data = new DualShock4HatState(null);
    // Deserialize message field [hat_x]
    data.hat_x = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [hat_y]
    data.hat_y = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pp8_msgs/DualShock4HatState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3e853de77a9549fef8a730a59484d6a2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #DualShock4 Hat State message
    int8 hat_x
    int8 hat_y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DualShock4HatState(null);
    if (msg.hat_x !== undefined) {
      resolved.hat_x = msg.hat_x;
    }
    else {
      resolved.hat_x = 0
    }

    if (msg.hat_y !== undefined) {
      resolved.hat_y = msg.hat_y;
    }
    else {
      resolved.hat_y = 0
    }

    return resolved;
    }
};

module.exports = DualShock4HatState;
