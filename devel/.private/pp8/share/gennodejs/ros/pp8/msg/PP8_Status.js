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

class PP8_Status {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.max_vel = null;
      this.max_pos = null;
    }
    else {
      if (initObj.hasOwnProperty('max_vel')) {
        this.max_vel = initObj.max_vel
      }
      else {
        this.max_vel = 0;
      }
      if (initObj.hasOwnProperty('max_pos')) {
        this.max_pos = initObj.max_pos
      }
      else {
        this.max_pos = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PP8_Status
    // Serialize message field [max_vel]
    bufferOffset = _serializer.uint16(obj.max_vel, buffer, bufferOffset);
    // Serialize message field [max_pos]
    bufferOffset = _serializer.uint16(obj.max_pos, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PP8_Status
    let len;
    let data = new PP8_Status(null);
    // Deserialize message field [max_vel]
    data.max_vel = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [max_pos]
    data.max_pos = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pp8/PP8_Status';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6cca4ef09711a7f41b34ac1b1e5c99e2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # PP8 Status message
    uint16 max_vel
    uint16 max_pos
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PP8_Status(null);
    if (msg.max_vel !== undefined) {
      resolved.max_vel = msg.max_vel;
    }
    else {
      resolved.max_vel = 0
    }

    if (msg.max_pos !== undefined) {
      resolved.max_pos = msg.max_pos;
    }
    else {
      resolved.max_pos = 0
    }

    return resolved;
    }
};

module.exports = PP8_Status;
