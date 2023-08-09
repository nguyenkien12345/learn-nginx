import React, { useEffect, useState } from "react";
import { Link, useLocation } from "react-router-dom";
// Bootstrap
import 'bootstrap/dist/css/bootstrap.css';
import { Container, Row, Col } from 'react-bootstrap';
// Css
import './index.css';

const Header = () => {
    const [activeTab, setActiveTab] = useState("Home");

    const location = useLocation();

    useEffect(() => {
        switch (location.pathname) {
            case '/':
                setActiveTab("Home");
                break;
            case '/home':
                setActiveTab("Home");
                break;
            case '/add':
                setActiveTab("Add");
                break;
            case '/about':
                setActiveTab("About");
                break;
            case '/faq':
                setActiveTab("Faq");
                break;
        }
        // if (location.pathname.startsWith('/edit/')) {
        //     setActiveTab("Add");
        // }
    }, [location]);

    const tabs = [
        { id: 1, tabName: 'Home', url: '/' },
        { id: 2, tabName: 'Add', url: '/add' },
        { id: 3, tabName: 'About', url: '/about' },
        { id: 4, tabName: 'Faq', url: '/faq' },
    ];

    const handleActive = (tab) => {
        setActiveTab(tab);
    };

    const checkActiveTab = (tabName = "Home") => {
        return activeTab === tabName ? "active p-2" : "p-2";
    };

    const showTab = () => {
        const result = tabs.map((item, index) => (
            <Link to={item.url} key={item.id} className="mx-2 text-uppercase text-white text-decoration-none fs-6">
                <p className={checkActiveTab(item.tabName)} onClick={() => handleActive(item.tabName)}>
                    {item.tabName}
                </p>
            </Link>
        ));
        return result;
    };

    return (
        <Container className="bg-secondary header p-2 mb-5 rounded">
            <Row className="d-flex align-items-center justify-content-center">
                <Col sm={6} md={6} lg={6} xl={6}>
                    <div className="header-left">
                        <p className="fs-3 fw-bolder text-dark text-center">Quản lý nhiệt độ, độ ẩm, bụi mịn, không khí</p>
                    </div>
                </Col>

                <Col sm={6} md={6} lg={6} xl={6}>
                    <div className="d-inline-flex align-items-center justify-content-center header-right">
                        {showTab()}
                    </div>
                </Col>
            </Row>
        </Container>
    )
};

export default Header;
