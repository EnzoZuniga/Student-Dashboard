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
        ratedskills {
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
export const USERS = gql`
  query USERS {
    users {
      username
      email
      role {
        name
      }
      description
      avatar {
        url
      }
      company
      id
      classrooms {
        class
      }
      ratedskills {
        rate {
          label
          level
        }
        skill {
          name
        }
      }
    }
  }
`;

export const CLASSROOMS = gql`
  query CLASSROOMS {
    classrooms {
      class
      id
    }
  }
`;

export const SKILLS = gql`
  query SKILLS {
    skills {
      id
      name
    }
  }
`;
export const RATES = gql`
  query RATES {
    rates {
      id
      label
      level
    }
  }
`;
