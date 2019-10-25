const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
  lastname: {
    type: String,
    required: false
  },
  firstname: {
    type: String,
    required: false
  },
  email: {
    type: String,
    required: false
  },
  skills: {
    type: Array,
    required: false
  },
  role: {
    type: String,
    required: false
  }
});

modules.export = mongoose.model("User", userSchema);
