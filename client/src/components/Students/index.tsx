import React, { useEffect } from "react";

import { useQuery } from "@apollo/react-hooks";
import {
  Layout,
  Table,
  Menu,
  Icon,
  Tag,
  Input,
  Tabs,
  PageHeader,
  Button,
  Select,
  Dropdown
} from "antd";
import { ReactComponent as LogoHetic } from "../../images/logo-hetic.svg";
import { getToken } from "../../utils/auth";
import { useHistory, Link } from "react-router-dom";
import { USERS } from "../../graphql/query";

const { Sider, Header, Content } = Layout;
const { Search } = Input;
const { TabPane } = Tabs;
const { Option } = Select;

const columns = [
  {
    title: "Nom Prénom",
    dataIndex: "user",
    render: (user: any) => <Link to={`/user/${user.id}`}>{user.username}</Link>
  },
  { title: "Adresse mail", dataIndex: "email" },
  {
    title: "Poste",
    dataIndex: "job",
    render: (job: string) => (
      <Tag key={job} color="blue">
        {job}
      </Tag>
    )
  },
  {
    title: "Crée le",
    dataIndex: "createdAt",
    render: (createdAt: number) => (
      <div>{new Date(createdAt).toLocaleDateString()}</div>
    )
  }
];

export default function Students(): JSX.Element {
  const { loading, error, data } = useQuery(USERS);

  if (loading) return <p>loading...</p>;
  if (error) return <p>error...</p>;

  console.log(data);

  const mockData = data.users
    .map((user: any) => ({
      _id: user.id,
      user: { id: user.id, username: user.username },
      email: user.email,
      job: user.job,
      createdAt: user.created_at
    }))
    .map((s: any) => ({ ...s, key: s.id }));

  //   useEffect(() => {
  //     if (getToken() === null) {
  //       history.push("/login");
  //     }
  //   }, []);

  return (
    <Layout style={{ height: "100vh" }}>
      <Sider theme="light">
        <Menu selectedKeys={["1"]} mode="inline" style={{ height: "100%" }}>
          <LogoHetic style={{ height: 32, margin: "24px 0" }} />
          <Menu.Item key="1">
            <Icon type="user" />
            Étudiants
          </Menu.Item>
        </Menu>
      </Sider>
      <Layout>
        <Header style={{ background: "white" }}>
          {/* <Input
                    placeholder="Rechercher"
                    prefix={
                        <Icon type="info-circle" style={{ color: 'rgba(0,0,0,.45)' }} />
                    }
                ></Input>
                <a className="ant-dropdown-link" href="#">
                    Kevin M <Icon type="down" />
                </a> */}
        </Header>
        <Content>
          <PageHeader
            title="Étudiants"
            extra={[
              <Select defaultValue="web3p2020" style={{ width: 160 }}>
                <Option value="web3p2020">WEB 3 P2020</Option>
              </Select>,
              <Button key="1" type="primary">
                Ajouter un élève
              </Button>
            ]}
          ></PageHeader>
          <Tabs
            defaultActiveKey="1"
            onChange={() => {}}
            style={{ margin: "0 24px" }}
          >
            <TabPane tab="Tous" key="1">
              <Table
                columns={columns}
                dataSource={mockData}
                rowClassName={() => "white"}
              ></Table>
            </TabPane>
            <TabPane tab="Front-End" key="2">
              <Table
                columns={columns}
                dataSource={mockData}
                rowClassName={() => "white"}
              ></Table>
            </TabPane>
            <TabPane tab="UX Designer" key="3">
              <Table
                columns={columns}
                dataSource={mockData}
                rowClassName={() => "white"}
              ></Table>
            </TabPane>
          </Tabs>
        </Content>
      </Layout>
    </Layout>
  );
}
