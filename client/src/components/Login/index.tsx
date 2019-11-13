import React, { FC } from "react";
import { Form, Icon, Input, Button } from 'antd';
import { ReactComponent as LogoHetic } from "../../images/logo-hetic.svg"
import "./index.scss";

const Login: FC = () => {

    const onHandleClick = () => {

    }

    return (
        <div className="loginContainer">
            <div className="logoHetic">
                <LogoHetic />
            </div>
            <div className="connection">
                <h1>Connexion</h1>
                <h3>Acceder à votre espace privée HETIC</h3>
                <Form onSubmit={onHandleClick} className="login-form">
                    <Form.Item>
                        <label>Adresse mail</label>
                        <Input
                            size="large"
                            prefix={<Icon type="user" style={{ color: 'rgba(0,0,0,.25)' }} />}
                            placeholder="exemple@hetic.net"
                        />
                    </Form.Item>
                    <Form.Item>
                        <label>Mot de passe</label>
                        <Input
                            size="large"
                            prefix={<Icon type="lock" style={{ color: 'rgba(0,0,0,.25)' }} />}
                            type="password"
                            placeholder="Entrez votre mot de passe"
                        />
                    </Form.Item>
                    <Form.Item>
                        <Button
                            size="large"
                            type="danger"
                            htmlType="submit"
                            className="login-form-button">
                            Se connecter
                        </Button>
                    </Form.Item>
                    <p>Vous n'avez pas de compte HETIC ? <a href="/signUp">Inscrivez-vous !</a></p>
                </Form>
            </div>
        </div>
    )
}

export default Login;