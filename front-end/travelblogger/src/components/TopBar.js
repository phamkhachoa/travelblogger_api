import React, { Component } from 'react';

class TopBar extends Component {
    render() {
        return (
            <div id="topbar" className="d-flex align-items-center fixed-top">
                <div className="container d-flex">
                    <div className="contact-info mr-auto">
                        <i className="icofont-phone" /> +1 5589 55488 55
                            <span className="d-none d-lg-inline-block">
                            <i className="icofont-clock-time icofont-rotate-180" /> Mon-Sat: 11:00 AM - 23:00 PM</span>
                    </div>
                    <div className="languages">
                        <ul>
                            <li>En</li>
                            <li><a href="#">De</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        );
    }
}

export default TopBar;