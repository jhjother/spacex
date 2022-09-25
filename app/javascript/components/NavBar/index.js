import { Container, Nav, Navbar } from "react-bootstrap";
import { Link } from "react-router-dom";
import React from "react";

const NavBar = () => {
  return (
    <Navbar bg="light" expand="lg">
      <Container>
        <Navbar.Brand href="/">SpaceX</Navbar.Brand>
        <Navbar.Toggle aria-controls="basic-navbar-nav"/>
        <Navbar.Collapse id="basic-navbar-nav">
          <Nav className="me-auto">
            <Link className="nav-link ml-4" to="/next_launch">Próximo lançamento</Link>
            <Link className="nav-link ml-4" to="/latest_launch">Último lançamento</Link>
            <Link className="nav-link ml-4" to="/upcoming_launch">Próximos lançamentos</Link>
            <Link className="nav-link ml-4" to="/past_launches">Lançamentos passados</Link>
          </Nav>
        </Navbar.Collapse>
      </Container>
    </Navbar>
  )
}

export default NavBar
