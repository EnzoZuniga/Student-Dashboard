import React, { FC } from "react";

import gql from 'graphql-tag';
import { useQuery } from '@apollo/react-hooks';
import { IStudent } from "../../interface/Student";
import { ISkill } from "../../interface/Skill";

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


export const Students: FC = () => {
    const { data, loading, error } = useQuery(GET_ALL_USERS);

    if (loading) {
        return <p>loading</p>
    }

    if (error) {
        return <p>error</p>
    }
    return (
        <div className="Students">
            {data["getUsers"].map((student: IStudent) => (
                <div key={student["_id"]}>
                    <p>
                        {student["_id"]}
                    </p>
                    <p>
                        {student.lastname}
                    </p>
                    <p>
                        {student.firstname}
                    </p>
                    <p>
                        {student.email}
                    </p>
                    <ul>
                        {student.skills.map((skill: ISkill) =>
                            <li>
                                {skill.skill}:{skill.rating}
                            </li>
                        )}
                    </ul>
                    <p>
                        {student.role}
                    </p>
                    <p>
                        {student.createdAt}
                    </p>
                </div>
            ))}
        </div>
    );
};
