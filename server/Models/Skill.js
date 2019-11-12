const mongoose = require("mongoose");

const skillSchema = new mongoose.Schema(
  {
    label: {
      type: String
    }
  },
  { timestamps: true }
);

module.exports = mongoose.model("Skill", skillSchema);
