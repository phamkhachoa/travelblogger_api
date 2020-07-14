import React, { Component } from 'react';

class Header extends Component {
  render() {
    return (
      <header id="header" className="fixed-top">
        <div className="container d-flex align-items-center">
          <h1 className="logo mr-auto"><a href="index.html">Restaurantly</a></h1>
          <nav className="nav-menu d-none d-lg-block">
            <ul>
              <li className="active"><a href="index.html">Home</a></li>
              <li><a href="#about">About</a></li>
              <li><a href="#menu">Menu</a></li>
              <li><a href="#specials">Specials</a></li>
              <li><a href="#events">Events</a></li>
              <li><a href="#gallery">Gallery</a></li>
              <li><a href="#chefs">Chefs</a></li>
              <li><a href="#contact">Contact</a></li>
              <li className="book-a-table text-center"><a href="#book-a-table">Book a table</a></li>
            </ul>
          </nav>
        </div>
      </header>
    );
  }
}

export default Header;