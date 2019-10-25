const User = require("../Models/User");
const { ApolloError } = require("apollo-server");

exports.resolvers = {
  Query: {
    getUsers: async (root, args, ctx) => {
      try {
        const users = await User.find();
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
    }
  },
  Mutation: {
    addUser: async (
      root,
      { data: { lastname, firstname, email, skills, role } },
      ctx
    ) => {
      try {
        const findedUser = await User.findOne({ email });
        if (findedUser) {
          throw new Error("User already exist");
        }
        const user = await User.create({
          lastname,
          firstname,
          email,
          skills,
          role
        });
        return user;
      } catch (error) {
        return new ApolloError(error.message, 404);
      }
    }
  }
};
