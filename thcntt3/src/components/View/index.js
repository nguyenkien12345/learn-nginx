import React, { useEffect, useState } from 'react';
import { Card, ListGroup, Button } from 'react-bootstrap';
import { Link, useParams } from 'react-router-dom';
import Header from '../Header';
import dataApi from '../../apis/dataApi';

const View = () => {

    const [data, setData] = useState({});

    const { id } = useParams();

    useEffect(() => {
        const fetchData = async () => {
            const result = await dataApi.getDetail(id);
            if (result.status === 200 && result.data.status === true) {
                setData(result.data.data);
            }
        };
        fetchData();
    }, [id]);

    return (
        <>
            <Header />
            <Card className="bg-light w-100">
                <Card.Body>
                    <Card.Title className='text-center text-uppercase alert alert-primary fw-bold mb-3 fs-3'>Detail</Card.Title>
                    <ListGroup className='w-100'>
                        <ListGroup.Item variant="primary" className="my-1 fs-5 text-start">
                            <strong className="fw-bolder">Nhiệt độ:</strong> {data.temperature} °C
                        </ListGroup.Item>
                        <ListGroup.Item variant="primary" className="my-1 fs-5 text-start">
                            <strong className="fw-bolder">Độ ẩm:</strong> {data.humidity} %
                        </ListGroup.Item>
                        <ListGroup.Item variant="primary" className="my-1 fs-5 text-start">
                            <strong className="fw-bolder">Bụi mịn:</strong> {data.dust} mg/m3
                        </ListGroup.Item>
                        <ListGroup.Item variant="primary" className="my-1 fs-5 text-start">
                            <strong className="fw-bolder">Không khí:</strong> {data.air} PPM
                        </ListGroup.Item>
                        <ListGroup.Item variant="primary" className="my-1 fs-5 text-start">
                            <strong className="fw-bolder">Thời gian:</strong> {data.time}
                        </ListGroup.Item>
                        <ListGroup.Item variant="primary" className="my-1 fs-5 text-start">
                            <strong className="fw-bolder">Ngày:</strong> {data.date}
                        </ListGroup.Item>
                    </ListGroup>

                    <Link to='/'>
                        <Button className='mt-3 mb-1 fs5 fw-bold w-100' variant="success">Về trang chủ</Button>
                    </Link>
                </Card.Body>
            </Card>
        </>
    );
};

export default View;
