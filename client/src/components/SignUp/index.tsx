import React, { FC, useState, useContext } from "react";
import { Form } from "antd";

import LoginBackground from "../LoginBackground/index";
import { Link, useHistory } from "react-router-dom";
import "./index.scss";
import FirstForm from "./firstForm";
import SecondForm from "./secondForm";
import { useMutation } from "@apollo/react-hooks";
import { REGISTER } from "../../graphql/mutation";
import { AuthContext } from "../../context/index";
import { setToken } from "../../utils/auth";
import { USERS } from "../../graphql/query";
interface IinitialState {
  lastname: String;
  firstname: String;
  email: String;
  password: String;
  role: String;
  classroom: String;
  job: String;
}
const initialState = {
  lastname: "",
  firstname: "",
  email: "",
  password: "",
  role: "student",
  classroom: "1",
  job: ""
};

const SignUp: FC = () => {
  const [values, setValues] = useState<IinitialState>({ ...initialState });
  const [checkboxValue, setCheckboxValue] = useState({});
  const [isRegisterSuite, setIsRegisterSuite] = useState(false);
  const [register] = useMutation(REGISTER);
  const { getCurrentUser }: any = useContext(AuthContext);
  const history = useHistory();

  useMutation(REGISTER);
  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    const {
      lastname,
      firstname,
      email,
      password,
      role,
      classroom,
      job
    } = values;
    console.log(values);
    const { data } = await register({
      variables: {
        username: `${lastname} ${firstname}`,
        email,
        password,
        role,
        classrooms: [classroom],
        Job: job
      }
    });

    console.log(data);

    setToken(data.register.jwt);
    getCurrentUser(data.register.user);
    await history.push("/");
  };

  function handleChange(e: React.FormEvent<HTMLInputElement>): void {
    const target = e.target as HTMLInputElement;
    setValues({
      ...values,
      [target.name]: target.value
    });
  }

  function handleCheckboxesChange(e: React.FormEvent<HTMLInputElement>) {
    const target = e.target as HTMLInputElement;

    setCheckboxValue({
      ...checkboxValue,
      [target.name]: target.value
    });
  }

  function handleRoleChange(role: string) {
    setValues({
      ...values,
      role
    });
  }
  function handleClassroomChange(classroom: string) {
    setValues({
      ...values,
      classroom
    });
  }

  return (
    <div className="signUpContainer">
      <div className="login__left">
        <div className="inscription">
          <h1>Créer un compte</h1>
          <h3>Informations personnelles</h3>
          <Form onSubmit={handleSubmit}>
            {!isRegisterSuite ? (
              <FirstForm
                handleChange={handleChange}
                handleSeletChange={handleRoleChange}
                setIsRegisterSuite={setIsRegisterSuite}
              />
            ) : (
              <SecondForm
                handleSelectChange={handleClassroomChange}
                handleChange={handleChange}
                handleCheckboxesChange={handleCheckboxesChange}
                checkboxValue={checkboxValue}
              />
            )}

            <p>
              Vous avez un compte HETIC ?{" "}
              <Link to="/login">Connectez-vous !</Link>
            </p>
          </Form>
        </div>
      </div>
      <div className="login__right">
        <LoginBackground />
      </div>
    </div>
  );
};

export default SignUp;
