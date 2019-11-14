import React, { FC, useState } from "react";
import { Form, Input, Button, Select } from "antd";

import LoginBackground from "../LoginBackground/index";
import { Link } from "react-router-dom";
import "./index.scss";
import FirstForm from "./firstForm";
import SecondForm from "./secondForm";

const { Option } = Select;

const initialState = {
  lastname: "",
  firstname: "",
  email: "",
  password: "",
  role: "student"
};

const SignUp: FC = () => {
  const [values, setValues] = useState({ ...initialState });
  const [checkboxValue, setCheckboxValue] = useState({});
  const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    console.log(values);
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

  function handleSeletChange(role: string) {
    setValues({
      ...values,
      role
    });
  }

  return (
    <div className="signUpContainer">
      <div className="login__left">
        <div className="inscription">
          <h1>Créer un compte</h1>
          <h3>Informations personnelles</h3>
          <Form onSubmit={handleSubmit}>
            {/* <FirstForm
              handleChange={handleChange}
              handleSeletChange={handleSeletChange}
            /> */}
            <SecondForm
              handleSelectChange={handleSeletChange}
              handleChange={handleChange}
              handleCheckboxesChange={handleCheckboxesChange}
              checkboxValue={checkboxValue}
            />
            <Form.Item>
              <Button
                type="default"
                htmlType="submit"
                size="large"
                className="login-form-button"
              >
                S'inscrire
              </Button>
            </Form.Item>
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
