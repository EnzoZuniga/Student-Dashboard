import React from "react";
import { Form, Input, Select, Button } from "antd";
const { Option } = Select;

export default function FirstForm({
  handleChange,
  handleSeletChange,
  setIsRegisterSuite
}: any) {
  return (
    <>
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
        <label style={{ marginRight: "5%" }}>Vous êtes</label>
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
          htmlType="button"
          size="large"
          className="login-form-button"
          onClick={() => setIsRegisterSuite(true)}
        >
          Suivant
        </Button>
      </Form.Item>
    </>
  );
}
