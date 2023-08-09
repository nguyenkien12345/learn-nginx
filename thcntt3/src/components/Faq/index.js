import React, { useState } from 'react';
import { Accordion } from 'react-bootstrap';
import Header from '../Header';

const About = () => {
    const list = [
        { id: 1, title: 'Nhiệt độ là gì', description: 'Nhiệt độ là một khái niệm trong vật lý dùng để đo đạc mức độ nóng hay lạnh của một vật, chất hay môi trường. Nhiệt độ thể hiện mức độ năng lượng nhiệt trong một hệ thống.' },
        { id: 2, title: 'Cách đo nhiệt độ', description: 'Nhiệt độ có thể được đo bằng cách sử dụng các thiết bị đo nhiệt độ như nhiệt kế hoặc các cảm biến nhiệt độ điện tử. Thông qua việc đo nhiệt độ, chúng ta có thể đánh giá và điều chỉnh môi trường nhiệt độ để phù hợp với các nhu cầu và yêu cầu cụ thể.' },
        { id: 3, title: 'Độ ẩm là gì', description: 'Độ ẩm là một đại lượng trong khí quyển dùng để đo lường mức độ ẩm ướt hay khô của không khí. Nó chỉ ra khối lượng hơi nước có mặt trong không khí so với khối lượng hơi nước tối đa có thể tồn tại ở cùng một nhiệt độ và áp suất.' },
        { id: 4, title: 'Cách đo độ ẩm', description: 'Để đo độ ẩm, có các thiết bị đo độ ẩm như hygrometer hoặc cảm biến độ ẩm được sử dụng. Những dữ liệu về độ ẩm rất quan trọng trong nhiều ngành công nghiệp và các lĩnh vực như dự báo thời tiết, nông nghiệp, điều hòa không khí, và quản lý môi trường.' },
        { id: 5, title: 'Bụi mịn là gì', description: 'Bụi mịn (hay còn được gọi là hạt mịn) là các hạt nhỏ có kích thước nhỏ hơn 2.5 micromet (μm) trong đường kính. Chúng được gọi là PM2.5 (Particulate Matter 2.5) và là một trong những loại bụi mịn phổ biến được quan tâm trong lĩnh vực môi trường và sức khỏe.' },
        { id: 6, title: 'Không khí là gì', description: 'Không khí là một hỗn hợp khí quyển tự nhiên mà chúng ta hít thở và tồn tại xung quanh chúng ta. Nó bao gồm một sự kết hợp của các khí, hơi nước, bụi, hạt nhỏ và các chất khác.' },
    ];

    const showCarouselItem = () => {
        const result = list.map((item, index) => (
            <Accordion.Item eventKey={item.id}>
                <Accordion.Header>{item.title}</Accordion.Header>
                <Accordion.Body>
                    {item.description}
                </Accordion.Body>
            </Accordion.Item>
        ));
        return result;
    };

    return (
        <>
            <Header />
            <Accordion defaultActiveKey="1" className='w-100' flush>
                {showCarouselItem()}
            </Accordion>
        </>
    );
};

export default About;
