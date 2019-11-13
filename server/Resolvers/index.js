const User = require("../Models/User");
const Skill = require("../Models/Skill");
const Classroom = require("../Models/Classroom");
const Role = require("../Models/Role");
const { ApolloError } = require("apollo-server");

exports.resolvers = {
  Query: {
    getUsers: async (root, args, ctx) => {
      try {
        const users = await User.find()
          .populate("skills.skill")
          .exec();
        if (!users.length) {
          throw new Error("No users");
        }
        return users;
      } catch (error) {
        return new ApolloError(error.message, 404);
      }
    },
    getUser: async (root, { id }, ctx) => {
      try {
        const user = await User.findById(id);
        return user;
      } catch (error) {
        return new ApolloError(error.message, 404);
      }
    },
    getSkill: async (root, args, ctx) => {
      try {
        return await Skill.find();
      } catch (error) {
        return new ApolloError(error.message, 404);
      }
    },
    getClassroom: async (root, args, ctx) => {
      try {
        return await Classroom.find();
      } catch (error) {
        return new ApolloError(error.message, 404);
      }
    },
    getRole: async (root, args, ctx) => {
      try {
        return await Role.find();
      } catch (error) {
        return new ApolloError(error.message, 404);
      }
    }
  },
  Mutation: {
    addSkill: async (root, { data: { label } }, ctx) => {
      try {
        return new Skill({ label }).save();
      } catch (error) {
        return new ApolloError(error.message, 404);
      }
    },
    addClassroom: async (root, { data: { label } }, ctx) => {
      try {
        return new Classroom({ label }).save();
      } catch (error) {
        return new ApolloError(error.message, 404);
      }
    },
    addRole: async (root, { data: { label, level } }, ctx) => {
      try {
        return new Role({ label, level }).save();
      } catch (error) {
        return new ApolloError(error.message, 404);
      }
    },
    signup: async (
      root,
      { data: { lastname, firstname, email, skills, role, password } },
      ctx
    ) => {
      try {
        const findedUser = await User.findOne({ email });
        if (findedUser) {
          throw new ApolloError("User already exist");
        }

        const skills = [
          {
            skill: "5dcaa03a3e6725ebc87e192f",
            rating: "C"
          },
          {
            skill: "5dcac9b215e00b0226103f88",
            rating: "C"
          },
          {
            skill: "5dcac9c915e00b0226103f89",
            rating: "C"
          },
          {
            skill: "5dcaca2315e00b0226103f8a",
            rating: "C"
          },
          {
            skill: "5dcaca3615e00b0226103f8b",
            rating: "C"
          },
          {
            skill: "5dcaca4215e00b0226103f8c",
            rating: "C"
          }
        ];

        const user = await User.create({
          lastname,
          firstname,
          email,
          role,
          skills
        });
        return user.populate("skills.skill").execPopulate();
      } catch (error) {
        return new ApolloError(error.message, 404);
      }
    }
  }
};
