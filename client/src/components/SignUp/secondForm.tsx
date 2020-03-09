import React from "react";
import { Form, Input, Select, Button } from "antd";
import { useQuery } from "@apollo/react-hooks";
import { CLASSROOMS } from "../../graphql/query";
import Checkboxes from "./checkboxes";
const { Option } = Select;

export default function SecondForm({ handleSeletChange, handleChange }: any) {
  const { error, data, loading } = useQuery(CLASSROOMS);
  if (error) return <p>error</p>;
  if (loading) return <p>loading...</p>;
  return (
    <div>
      <Form.Item>
        <label style={{ display: "block" }}>Votre Promotion</label>
        <Select
          defaultValue="1"
          style={{ width: 240 }}
          onChange={handleSeletChange}
        >
          {data.classrooms.map((c: any) => (
            <Option key={c.id} value={c.id}>
              {c.class}
            </Option>
          ))}
        </Select>
      </Form.Item>
      <Form.Item>
        <label>Votre Métier</label>
        <Input
          placeholder="UI DESIGNER"
          size="large"
          name="job"
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
    </div>
  );
}
