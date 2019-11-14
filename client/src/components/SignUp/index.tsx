import React, { FC, useState } from "react";
import { Form, Input, Button, Select } from "antd";

import LoginBackground from "../LoginBackground/index";
import { Link } from "react-router-dom";
import "./index.scss";

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
            <Form.Item>
              <label>Nom</label>
              <Input
                placeholder="Entrez votre nom"
                size="large"
                name="lastname"
                onChange={handleChange}
              />
            </Form.Item>
            <Form.Item>
              <label>Prénom</label>
              <Input
                placeholder="Entrez votre prénom"
                size="large"
                name="firstname"
                onChange={handleChange}
              />
            </Form.Item>
            <Form.Item>
              <label htmlFor="">Vous êtes</label>
              <Select
                defaultValue="student"
                style={{ width: 120 }}
                onChange={handleSeletChange}
              >
                <Option value="student">Élève</Option>
                <Option value="teacher">Professeur</Option>
              </Select>
            </Form.Item>

            <Form.Item>
              <label>Adresse email</label>
              <Input
                placeholder="exemple@hetic.net"
                size="large"
                name="email"
                onChange={handleChange}
              />
            </Form.Item>
            <Form.Item>
              <label>Mot de passe</label>
              <Input.Password
                placeholder="Entrez votre mot de passe"
                size="large"
                name="password"
                onChange={handleChange}
              />
            </Form.Item>

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
