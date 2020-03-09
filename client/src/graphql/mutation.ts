import gql from "graphql-tag";
export const REGISTER = gql`
  mutation REGISTER(
    $username: String!
    $email: String!
    $password: String!
    $Job: String
    $classrooms: [ID]!
    $role: ID
  ) {
    register(
      input: {
        username: $username
        email: $email
        password: $password
        Job: $Job
        classrooms: $classrooms
        role: $role
      }
    ) {
      jwt
      user {
        id
        username
        email
        Job
        role {
          name
        }
      }
    }
  }
`;

export const LOGIN = gql`
  mutation LOGIN($identifier: String!, $password: String!) {
    login(input: { identifier: $identifier, password: $password }) {
      jwt
      user {
        username
        email
        id
        Job
        description
      }
    }
  }
`;
