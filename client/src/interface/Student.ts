import { ISkill } from "./Skill";

export interface IStudent {
    "_id": number,
    lastname: string,
    firstname: string,
    email: string,
    skills: ISkill[],
    role: string,
    createdAt?: string,
};
