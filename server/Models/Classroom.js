const mongoose = require("mongoose");

const classroomSchema = new mongoose.Schema({
  label: {
    type: String
  },
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User"
  }
});

module.exports = mongoose.model("Classroom", classroomSchema);
