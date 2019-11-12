const { gql } = require("apollo-server");

const typeDefs = gql`
  type User {
    _id: ID!
    lastname: String
    firstname: String
    email: String
    skills: [RatedSkill]
    role: Role
    classroom: Classroom
    job: String
    description: String
    createdAt: String
  }

  type RatedSkill {
    _id: ID!
    skill: Skill
    rating: String
  }

  type Skill {
    _id: ID!
    label: String
    userId: [User]
  }

  type Role {
    _id: ID!
    label: String
    level: Int
    userId: [User]
  }

  type Classroom {
    _id: ID!
    label: String
    userId: [User]
  }

  input ClassroomInput {
    label: String
  }

  input SigninUserInput {
    email: String!
    password: String!
  }

  input SignupUserInput {
    firstname: String
    lastname: String
    email: String
    password: String
  }

  input SkillInput {
    label: String!
  }

  input UserInput {
    lastname: String
    firstname: String
    email: String
    skills: [SkillInput]
    role: String
  }

  input RoleInput {
    label: String
    level: Int
  }

  type Query {
    getUsers: [User]
    getUser(id: ID!): User
    getSkill: [Skill]
    getClassroom: [Classroom]
    getRole: [Role]
  }

  type Mutation {
    addUser(data: UserInput): User!
    addSkill(data: SkillInput): Skill!
    addRole(data: RoleInput): Role!
    addClassroom(data: ClassroomInput): Classroom
    updateUser(id: ID!, data: UserInput): User!
    deleteUser(id: ID): User
  }
`;

module.exports = typeDefs;
