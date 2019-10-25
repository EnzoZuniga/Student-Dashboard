const mongoose = require("mongoose");

const userSchema = new mongoose.Schema(
  {
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
      required: false,
      default: [{ skill: "test", rating: "A" }]
    },
    role: {
      type: String,
      required: false
    }
  },
  { timestamps: true }
);

module.exports = mongoose.model("User", userSchema);
