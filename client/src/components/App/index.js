import React from 'react';
import './index.css';

import gql from 'graphql-tag';
import { useQuery } from '@apollo/react-hooks';

const GET_ALL_USERS = gql`
{
  getUsers {
    _id
    lastname
    firstname
    email
    skills {
      skill
      rating
    }
    role
    createdAt
  }
}
`;

function App() {
  const {data , loading, error} = useQuery(GET_ALL_USERS)

  if(loading)
  {
    return <p>loading</p>
  }

  if(error)
  {
    return <p>error</p>
  }
  console.log(data)
  return (
    <div className="App">
      {data["getUsers"].map(({id,lastname,firstname,email,skills,role,createdAt})=>(
      <div key={id}>
        <p>
          {id}
        </p>
        <p>
          {lastname}
        </p>
        <p>
          {firstname}
        </p>
        <p>
          {email}
        </p>
        <ul>
          {skills.map(({skill,rating})=>
          <li>
            {skill}:{rating}
          </li>
          )}
        </ul>
        <p>
          {role}
        </p>
        <p>
          {createdAt}
        </p>
      </div>
      ))}
    </div>
  );
}

export default App;
