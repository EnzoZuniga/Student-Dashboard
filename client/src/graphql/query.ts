import gql from "graphql-tag";

export const ME = gql`
  query ME {
    me {
      username
      id
      email
    }
  }
`;

export const USER = gql`
  query USER($id: ID!) {
    user(id: $id) {
      username
      email
      company
      Skills {
        id
        skill {
          name
        }
        rate {
          label
          level
        }
      }
      Job
      created_at
      role {
        name
      }
    }
  }
`;
