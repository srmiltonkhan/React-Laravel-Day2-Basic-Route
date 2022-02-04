import React from "react";
import {
    Container,
    Nav,
    NavbarBrand,
    NavLink,
    NavDropdown,
} from "react-bootstrap";
import NavbarCollapse from "react-bootstrap/esm/NavbarCollapse";
import NavbarToggle from "react-bootstrap/esm/NavbarToggle";

import Navbar from "react-bootstrap/Navbar";

const Header = () => {
    return (
        <>
            <Navbar>
                <Container>
                    <NavbarBrand href="#home">React-Bootstrap</NavbarBrand>
                    <NavbarToggle aria-controls="basic-navbar-nav"></NavbarToggle>
                    <NavbarCollapse id="basic-navbar-nav">
                        <Nav className="me-auto">
                            <NavLink href="#">Home</NavLink>
                            <NavLink href="#">Link</NavLink>
                            <NavDropdown
                                title="Dropdown"
                                id="basic-nav-dropdown"
                            >
                                <NavDropdown.Item href="#action/3.1">
                                    Action
                                </NavDropdown.Item>
                                <NavDropdown.Item href="#action/3.2">
                                    Another action
                                </NavDropdown.Item>
                                <NavDropdown.Item href="#action/3.3">
                                    Something
                                </NavDropdown.Item>
                                <NavDropdown.Divider />
                                <NavDropdown.Item href="#action/3.4">
                                    Separated link
                                </NavDropdown.Item>
                            </NavDropdown>
                        </Nav>
                    </NavbarCollapse>
                </Container>
            </Navbar>
        </>
    );
};

export default Header;
