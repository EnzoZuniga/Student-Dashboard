import React, { FC, useState } from "react";
import { Form, Icon, Input, Button } from "antd";
import { ReactComponent as LogoHetic } from "../../images/logo-hetic.svg";
import { LOGIN } from "../../graphql/mutation";
import { useMutation } from "@apollo/react-hooks";
import { Link } from "react-router-dom";
import "./index.scss";

interface loginForm {
  identifier: string;
  password: string;
}

const initialState = {
  identifier: "",
  password: ""
};

const Login: React.FC = () => {
  const [value, setvalue] = useState<loginForm>({ ...initialState });
  const [login] = useMutation(LOGIN);

  async function handleSubmit(
    e: React.FormEvent<HTMLFormElement>
  ): Promise<void> {
    if (!value.identifier || !value.password) return;
    e.preventDefault();
    console.log(value);
    const { data } = await login({ variables: { ...value } });
    localStorage.setItem("token", data.login.jwt);
  }
  return (
    <div className="loginContainer">
      <div className="logoHetic">
        <LogoHetic />
      </div>
      <div className="connection">
        <h1>Connexion</h1>
        <h3>Acceder à votre espace privée HETIC</h3>
        <Form onSubmit={handleSubmit} className="login-form">
          <Form.Item>
            <label>Adresse mail</label>
            <Input
              size="large"
              name="identifier"
              type="email"
              prefix={<Icon type="user" style={{ color: "rgba(0,0,0,.25)" }} />}
              placeholder="exemple@hetic.net"
              onChange={e => setvalue({ ...value, identifier: e.target.value })}
            />
          </Form.Item>
          <Form.Item>
            <label>Mot de passe</label>
            <Input
              size="large"
              prefix={<Icon type="lock" style={{ color: "rgba(0,0,0,.25)" }} />}
              type="password"
              name="password"
              placeholder="Entrez votre mot de passe"
              onChange={e => setvalue({ ...value, password: e.target.value })}
            />
          </Form.Item>
          <Form.Item>
            <Button
              size="large"
              type="danger"
              htmlType="submit"
              className="login-form-button"
            >
              Se connecter
            </Button>
          </Form.Item>
          <p>
            Vous n'avez pas de compte HETIC ?{" "}
            <Link to="/signUp">Inscrivez-vous !</Link>
          </p>
        </Form>
      </div>
    </div>
  );
};

export default Login;
