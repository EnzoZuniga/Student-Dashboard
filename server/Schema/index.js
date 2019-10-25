const { gql } = require("apollo-server");

const typeDefs = gql`
  type User {
    _id: ID!
    lastname: String
    firstname: String
    email: String
    skills: [String]
    role: String
    createdAt: String
  }

  type Skill {
    _id: ID!
    skill: String
  }

  input UserInput {
    lastname: String
    firstname: String
    email: String
    skills: [String]
    role: String
  }

  input SkillInput {
    skill: [String]
  }

  type Query {
    getUsers: [User]
    getUser(id: ID!): User
  }

  type Mutation {
    addUser(data: UserInput): User!
    updateUser(id: ID!, data: UserInput): User!
    deleteUser(id: ID): User
  }
`;

module.exports = typeDefs;
