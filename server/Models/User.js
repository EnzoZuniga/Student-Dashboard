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
    skills: [
      {
        skill: {
          type: mongoose.Schema.Types.ObjectId,
          ref: 'Skill'
        },
        rating: {
          type: String,
          enum: ['A', 'B', 'C', 'D', 'E', 'F']
        }
      }
    ],
    role: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Role",
    },
    classroom: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Classroom",
    }
  },
  { timestamps: true }
);

module.exports = mongoose.model("User", userSchema);
