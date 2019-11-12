const mongoose = require("mongoose");

const classroomSchema = new mongoose.Schema(
  {
    label: {
      type: String
    },
  },
  { timestamps: true }
);

module.exports = mongoose.model("Classroom", classroomSchema);
