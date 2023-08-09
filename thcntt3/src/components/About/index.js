import React, { useState } from 'react';
import { Carousel } from 'react-bootstrap';
// Images
import Dust from '../../images/Dust.jpg';
import Humidity from '../../images/Humidity.jpg';
import Temperature from '../../images/Temperature.jpg';
import Air from '../../images/Air.jpg';
import Header from '../Header';

const About = () => {
    const [index, setIndex] = useState(0);

    const handleSelect = (selectedIndex) => {
        setIndex(selectedIndex);
    };

    const list = [
        { id: 1, name: 'Quản lý bụi mịn', image: Dust, slug: 'quan-ly-bui-min' },
        { id: 2, name: 'Quản lý độ ẩm', image: Humidity, slug: 'quan-ly-do-am' },
        { id: 3, name: 'Quản lý nhiệt độ', image: Temperature, slug: 'quan-ly-nhiet-do' },
        { id: 4, name: 'Quản lý không khí', image: Air, slug: 'quan-ly-khong-khi' }
    ];

    const showCarouselItem = () => {
        const result = list.map((item, index) => (
            // toàn bộ các slide sẽ chuyển động sau 1.5s
            <Carousel.Item interval={1500} key={item.id}>
                <img className="d-block w-100" src={item.image} alt={item.slug} />
                <Carousel.Caption>
                    <h3 className='text-uppercase text-black fs-5 fw-bold'>{item.name}</h3>
                </Carousel.Caption>
            </Carousel.Item>
        ));
        return result;
    };

    return (
        <>
            <Header />
            <Carousel activeIndex={index} onSelect={handleSelect} fade className='w-50' data-bs-theme="dark">
                {showCarouselItem()}
            </Carousel>
        </>
    );
};

export default About;
