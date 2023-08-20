import React, { useState, useEffect } from 'react';
// Apis
import dataApi from '../../apis/dataApi';
// Bootstrap
import 'bootstrap/dist/css/bootstrap.css';
import { Table, Modal, Button, OverlayTrigger, Tooltip } from 'react-bootstrap';
// FontAwesom
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faCircleInfo, faPenToSquare, faTrash } from '@fortawesome/free-solid-svg-icons';
// React Router Dom
import { Link } from 'react-router-dom';
import Header from '../Header';
// Others
import { toast } from 'react-toastify';

const Home = () => {
    const [data, setData] = useState([]);
    const [idDelete, setIdDelete] = useState(null);
    const [theadTable, setTheadTable] = useState([]);
    // For Modal
    const [show, setShow] = useState(false);

    const showTooltip = (message = null) => (
        <Tooltip className="tooltip">{message}</Tooltip>
    );

    const handleClose = () => {
        setShow(false);
        setIdDelete(null);
    };

    const handleShow = (id) => {
        setShow(true);
        setIdDelete(id);
    };

    const onHandleDelete = async (id) => {
        const result = await dataApi.remove(id);
        if (result.status === 200 && result.data.status === true) {
            toast.success('Xóa dữ liệu thành công');
        }
        else {
            toast.success('Xóa dữ liệu thất bại');
        }
        setIdDelete(null);
        setShow(false);
        fetchData();
    };

    const fetchData = async () => {
        const result = await dataApi.getAll();
        setData(result.data.data.data);
    };

    useEffect(() => {
        fetchData();
    }, []);

    // const getAllTheadTable = () => {
    //     if (data.length > 0) {
    //         // Lý thuyết
    //         // + accumulator: giá trị tích lũy từ các lần lặp trước đó. Nó truyền giá trị của initialValue trong lần lặp đầu tiên
    //         // (nếu được cung cấp), và sau đó truyền giá trị trả về của callback từ lần lặp trước.

    //         // + concat() để nối (concatenate) hai hoặc nhiều mảng lại với nhau để tạo thành một mảng mới.
    //         const keys = data.reduce((accumulator, item) => {
    //             return accumulator.concat(Object.keys(item));
    //         }, []);

    //         const uniquekeys = [...new Set(keys)];

    //         const [_id, temperature, humidity, dust, active, date, time, createdAt, updatedAt, __v] = uniquekeys;
    //         const ths = [_id, temperature, humidity, dust, active, date, time];

    //         const showTH = ths.map((item, index) => (
    //             <th key={index}>{item}</th>
    //         ));
    //         return showTH;
    //     }
    // };

    const showActions = (id) => (
        <>
            <OverlayTrigger placement="top" overlay={showTooltip('Chi tiết')}>
                <Link to={`/detail/${id}`}>
                    <FontAwesomeIcon icon={faCircleInfo} size="lg" color="blue" className='p-2' />
                </Link>
            </OverlayTrigger>

            <OverlayTrigger placement="top" overlay={showTooltip('Cập nhật')}>
                <Link to={`/edit/${id}`}>
                    <FontAwesomeIcon icon={faPenToSquare} size="lg" color="green" className='p-2' />
                </Link>
            </OverlayTrigger>

            <OverlayTrigger placement="top" overlay={showTooltip('Xóa')}>
                <FontAwesomeIcon icon={faTrash} size="lg" color="red" className='p-2' onClick={() => handleShow(id)} />
            </OverlayTrigger>
        </>
    );

    const showData = () => {
        if (data.length > 0) {
            const result = data.map((item, index) => (
                <tr key={item._id}>
                    <td className='text-end align-middle'>{item.temperature} °C</td>
                    <td className='text-end align-middle'>{item.humidity} %</td>
                    <td className='text-end align-middle'>{item.dust} mg/m3</td>
                    <td className='text-end align-middle'>{item.air} PPM</td>
                    <td className='text-center align-middle'>{item.date}</td>
                    <td className='text-center align-middle'>{item.time}</td>
                    <td className='d-flex flex-row justify-content-around'>
                        {showActions(item._id)}
                    </td>
                </tr>
            ));
            return result;
        }
    };

    const showThead = () => {
        const data = ['Nhiệt độ', 'Độ ẩm', 'Bụi mịn', 'Không khí', 'Ngày', 'Thời gian', 'Actions'];
        const result = data.map((item, index) => (
            <th key={index} className='text-center text-capitalize text-primary bg-light fs-5 fw-bolder'>{item}</th>
        ));
        return result;
    };

    const showConfirmDelete = () => (
        <Modal show={show} onHide={handleClose}>
            <Modal.Header closeButton>
                <Modal.Title>Xóa dữ liệu</Modal.Title>
            </Modal.Header>
            <Modal.Body>Bạn có chắc chắn muốn xóa dữ liệu ?</Modal.Body>
            <Modal.Footer>
                <Button variant="secondary" onClick={() => onHandleDelete(idDelete)}>Có</Button>
                <Button variant="primary" onClick={handleClose}>Không</Button>
            </Modal.Footer>
        </Modal>
    );

    return (
        <>
            <Header />
            <Table striped bordered hover>
                <thead>
                    <tr>
                        {showThead()}
                    </tr>
                </thead>
                <tbody>
                    {
                        data.length > 0 ? showData()
                            : <tr>
                                <td colSpan={5} className='text-center text-uppercase text-dark fw-bold fs-4 py-3'>Dữ liệu rỗng</td>
                            </tr>}
                </tbody>
            </Table>
            {showConfirmDelete()}
        </>
    );
};

export default Home;
