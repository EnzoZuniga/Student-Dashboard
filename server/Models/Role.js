const mongoose = require("mongoose");

const roleSchema = new mongoose.Schema(
  {
    label: {
      type: String
    },
    level: {
      type: Number
    }
  },
  { timestamps: true }
);

module.exports = mongoose.model("Role", roleSchema);
