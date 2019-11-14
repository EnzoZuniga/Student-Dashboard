import React, { FC } from "react";
import { ReactComponent as LogoHetic } from "../../images/logo-hetic.svg"
import { Menu, Icon } from 'antd';
import Search from "antd/lib/input/Search";

const SidePanel: FC = () => {

    const { SubMenu } = Menu;

    return (
        <div className="sidePanelContainer">
            <div className="logoHetic">
                <LogoHetic />
            </div>
            <div className="menuContainer">
                <Menu
                    style={{ width: 256 }}
                    defaultSelectedKeys={['1']}
                    defaultOpenKeys={['sub1']}>
                    <Menu.Item  key="1">
                        <Icon type="user" />
                        Navigation One
                    </Menu.Item>
                </Menu>
            </div>
        </div>
    )
}

const Header: FC = () => {
    return (
        <div>
            <Search
                placeholder="Rechercher"
                onSearch={value => console.log(value)}
                style={{ width: 500 , height: 50}}
                size="large"
            />
        </div>
    )
}

const Customers: FC = () => {
    return (
        <div className="customersContainer">
            <SidePanel />
            <Header/>
        </div>
    )
}

export default Customers;