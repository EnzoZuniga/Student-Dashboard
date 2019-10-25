const { gql } = require("apollo-server");

const typeDefs = gql`
  type User {
    id: ID!
    lastname: String
    firstname: String
    email: String
    skills: [Skill]
    role: String
  }

  type Skill {
    id: ID!
    skill: String
  }

  type Query {
    getUsers: [User]
    getUser(id: ID!): User
  }
`;

module.exports = typeDefs;
