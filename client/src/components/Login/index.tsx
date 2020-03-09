import React, { FC, useState } from "react";
import { Form, Icon, Input, Button } from "antd";
import { LOGIN } from "../../graphql/mutation";
import { useMutation } from "@apollo/react-hooks";
import { Link, useHistory } from "react-router-dom";
import LoginBackground from "../LoginBackground/index";

import "./index.scss";
import { setToken } from "../../utils/auth";

interface loginForm {
  identifier: string;
  password: string;
}

const initialState = {
  identifier: "",
  password: ""
};

const Login: FC = (props: any) => {
  const [value, setvalue] = useState<loginForm>({ ...initialState });
  const [login] = useMutation(LOGIN);
  const history = useHistory();

  async function handleSubmit(
    e: React.FormEvent<HTMLFormElement>
  ): Promise<void> {
    if (!value.identifier || !value.password) return;
    e.preventDefault();
    const { data } = await login({ variables: { ...value } });
    setToken(data.login.jwt);
    history.push("/");
  }
  return (
    <div className="loginContainer">
      <div className="login__left">
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
                prefix={
                  <Icon type="user" style={{ color: "rgba(0,0,0,.25)" }} />
                }
                placeholder="exemple@hetic.net"
                onChange={e =>
                  setvalue({ ...value, identifier: e.target.value })
                }
              />
            </Form.Item>
            <Form.Item>
              <label>Mot de passe</label>
              <Input
                size="large"
                prefix={
                  <Icon type="lock" style={{ color: "rgba(0,0,0,.25)" }} />
                }
                type="password"
                name="password"
                placeholder="Entrez votre mot de passe"
                onChange={e => setvalue({ ...value, password: e.target.value })}
              />
            </Form.Item>
            <Form.Item>
              <Button
                size="large"
                type="default"
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
      <div className="login__right">
        <LoginBackground />
      </div>
    </div>
  );
};

export default Login;
