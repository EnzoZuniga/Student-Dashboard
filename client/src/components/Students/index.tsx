import React, { FC } from "react";

import gql from 'graphql-tag';
import { useQuery } from '@apollo/react-hooks';
import { IStudent } from "../../interface/Student";
import { ISkill } from "../../interface/Skill";
import { fcall } from "q";
import { Layout, Table, Menu, Icon, Tag, Input, Tabs, PageHeader, Button, Select, Dropdown } from 'antd'
import { ReactComponent as LogoHetic } from "../../images/logo-hetic.svg"

const { Sider, Header, Content } = Layout
const { Search } = Input
const { TabPane } = Tabs
const { Option } = Select

const GET_ALL_USERS = gql`
{
  getUsers {
    _id
    lastname
    firstname
    email
    skills {
      skill
      rating
    }
    role
    createdAt
  }
}
`;


export const StudentsOld: FC = () => {
    const { data, loading, error } = useQuery(GET_ALL_USERS);

    if (loading) {
        return <p>loading</p>
    }

    if (error) {
        return <p>error</p>
    }
    return (
        <div className="Students">
            {data["getUsers"].map((student: IStudent) => (
                <div key={student["_id"]}>
                    <p>
                        {student.lastname}
                    </p>
                    <p>
                        {student.firstname}
                    </p>
                    <p>
                        {student.email}
                    </p>
                    <ul>
                        {student.skills.map((skill: ISkill) =>
                            <li>
                                {skill.skill}:{skill.rating}
                            </li>
                        )}
                    </ul>
                    <p>
                        {student.role}
                    </p>    
                </div>
            ))}
        </div>
    );
};

export const Student: FC = () => {
    return(
        <div></div>
    );
};


const columns = [
    { title: 'Nom', dataIndex: 'lastname' },
    { title: 'Prénom', dataIndex: 'firstname' },
    { title: 'Adresse mail', dataIndex: 'email' },
    {
        title: 'Poste',
        dataIndex: 'skills',
        render: (skills: ISkill[]) =>
            skills.map(({ skill }) =>
                <Tag key={skill} color="blue">
                    {skill}
                </Tag>
            )
    },
    {
        title: 'Crée le',
        dataIndex: 'createdAt',
        render: (createdAt: number) => <div>{new Date(createdAt).toLocaleDateString()}</div>
    },
]

const mockData = [...Array(20)].map((_, i) => ({
    _id: Math.random(),
    lastname: i,
    firstname: 'Raveenthiran',
    email: 'raveenthiran.ptp@hetic.net',
    skills: [ { skill: 'JavaScript', rating: 'A' } ],
    role: 'Human',
    createdAt: Date.now(),
})).map(student => ({ ...student, key: student._id }))


export const Students: FC = () =>
    <Layout style={{ height: '100vh' }}>
        <Sider theme="light">
            <Menu
                selectedKeys={['1']}
                mode="inline"
                style={{ height: '100%' }}
            >
                <LogoHetic style={{ height: 32, margin: '24px 0' }} />
                <Menu.Item key='1'>
                    <Icon type="user" />
                    Étudiants
                </Menu.Item>
            </Menu>
        </Sider>
        <Layout>
            <Header style={{ background: 'white' }}>
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
                    title='Étudiants'
                    extra={[
                        <Select defaultValue="web3p2020" style={{ width: 160 }}>
                          <Option value="web3p2020">WEB 3 P2020</Option>
                        </Select>,
                        <Button key="1" type="primary">
                            Ajouter un élève
                        </Button>,
                    ]}
                >

                </PageHeader>
                <Tabs defaultActiveKey="1" onChange={() => {}} style={{ margin: '0 24px' }}>
                  <TabPane tab="Tous" key="1">
                    <Table
                        columns={columns}
                        dataSource={mockData}
                        rowClassName={() => 'white'}
                    >
                    </Table>
                  </TabPane>
                  <TabPane tab="Front-End" key="2">
                    <Table
                        columns={columns}
                        dataSource={mockData}
                        rowClassName={() => 'white'}
                    >
                    </Table>
                  </TabPane>
                  <TabPane tab="UX Designer" key="3">
                    <Table
                        columns={columns}
                        dataSource={mockData}
                        rowClassName={() => 'white'}
                    >
                    </Table>
                  </TabPane>
                </Tabs>
                
            </Content>
        </Layout>
    </Layout>