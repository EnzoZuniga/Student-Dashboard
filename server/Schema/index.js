const { gql } = require("apollo-server");

const typeDefs = gql`
  type User {
    _id: ID!
    lastname: String
    firstname: String
    email: String
    skills: [Skill]
    role: String
    createdAt: String
  }

  type Skill {
    skill: String
    rating: String
  }

  input UserInput {
    lastname: String
    firstname: String
    email: String
    skills: [SkillInput]
    role: String
  }
  input SkillInput {
    skill: String
    rating: String
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
