import React, { FC } from "react";
import { Form, Icon, Input, Button } from 'antd';
import { ReactComponent as LogoHetic } from "../../images/logo-hetic.svg"
import "./index.scss";

const SignUp: FC = () => {

    const onHandleClick = () => {

    }

    return (
        <div className="signUpContainer">
            <div className="logoHetic">
                <LogoHetic />
            </div>
            <div className="inscription">
                <h1>Créer un compte</h1>
                <h3>Créer votre espace privé HETIC</h3>
                <Form onSubmit={onHandleClick}>
                    <Form.Item >
                        <label>Nom</label>
                        <Input
                            placeholder="Entrez votre nom"
                            size="large"
                        />
                    </Form.Item>
                    <Form.Item >
                        <label>Prénom</label>
                        <Input
                            placeholder="Entrez votre prénom"
                            size="large"
                        />
                    </Form.Item>
                    <Form.Item >
                        <label>Adresse email</label>
                        <Input
                            prefix={<Icon type="user" style={{ color: 'rgba(0,0,0,.25)' }} />}
                            placeholder="exemple@hetic.net"
                            size="large"
                        />
                    </Form.Item>
                    <Form.Item>
                        <label>Mot de passe</label>
                        <Input.Password
                            placeholder="Entrez votre mot de passe"
                            size="large"
                            prefix={<Icon type="lock" style={{ color: 'rgba(0,0,0,.25)' }} />}
                        />
                        <h3>Votre mot de passe doit contenir au moin une majuscule et un chiffre.</h3>
                    </Form.Item>
                    <Form.Item>
                        <Button
                            type="danger"
                            htmlType="submit"
                            size="large"
                            className="login-form-button">
                            S'inscrire
                        </Button>
                    </Form.Item>
                    <p>Vous avez un compte HETIC ? <a href="/login">Connectez-vous !</a></p>
                </Form>
            </div>
        </div>
    )
}

export default SignUp;