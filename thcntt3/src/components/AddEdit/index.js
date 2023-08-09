import React, { useEffect, useState } from "react";
import { Form, Row, Col, Button, Card, Modal } from "react-bootstrap";
import { useHistory, useLocation, useParams } from 'react-router-dom';
import { toast } from 'react-toastify';
import dataApi from "../../apis/dataApi";
import Header from "../Header";

const AddEdit = () => {
    const initialState = {
        temperature: "",
        humidity: "",
        dust: "",
        air: "",
    };

    // For Modal
    const [show, setShow] = useState(false);
    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);

    const [state, setState] = useState(initialState);

    const { temperature, humidity, dust, air } = state;

    const location = useLocation();
    const history = useHistory();
    const { id } = useParams();

    useEffect(() => {
        getDetailData(id);
    }, [id]);

    const getDetailData = async () => {
        const result = await dataApi.getDetail(id);
        if (result.status === 200 && result.data.status === true) {
            const { temperature, humidity, dust, air } = result.data.data;
            setState({ ...state, temperature, humidity, dust, air });
        }
    }

    const handleRedirectToHomePage = () => {
        setShow(false);
        toast.info(`Bạn đã hủy tiến trình ${id ? "cập nhật" : "thêm"} dữ liệu`);
        setTimeout(() => history.push('/'), 1800);
    };

    const handleChangeValue = (event) => {
        const { name, value } = event.target;
        setState({ ...state, [name]: value });
    };

    const onHandleSubmit = async (event) => {
        event.preventDefault();
        if (!temperature) {
            toast.warn("Vui lòng nhập nhiệt độ");
            return;
        }
        else if (!humidity) {
            toast.warn("Vui lòng nhập độ ẩm");
            return;
        }
        else if (!dust) {
            toast.warn("Vui lòng nhập bụi mịn");
            return;
        }
        else if (!air) {
            toast.warn("Vui lòng nhập không khí");
            return;
        }
        else {
            const data = {
                temperature: parseFloat(temperature),
                humidity: parseFloat(humidity),
                dust: parseFloat(dust),
                air: parseFloat(air),
            };
            let result = null;
            if (id) {
                result = await dataApi.update({ ...data, id });
            }
            else {
                result = await dataApi.add(data);
            }
            if (result.status === 200 && result.data.status === true) {
                toast.success(`${id ? "Cập nhật" : "Thêm"} dữ liệu thành công`);
            }
            else {
                toast.error(`${id ? "Cập nhật" : "Thêm"} dữ liệu thất bại`);
            }
            setState({
                temperature: "",
                humidity: "",
                dust: "",
                air: "",
            });
        }
        setTimeout(() => history.push('/'), 1800);
    };

    const showConfirmCancel = () => (
        <Modal show={show} onHide={handleClose}>
            <Modal.Header closeButton>
                <Modal.Title>Hủy</Modal.Title>
            </Modal.Header>
            <Modal.Body>Bạn có chắc chắn muốn hủy tiến trình {id ? "cập nhật" : "thêm"} dữ liệu ?</Modal.Body>
            <Modal.Footer>
                <Button variant="secondary" onClick={handleRedirectToHomePage}>Có</Button>
                <Button variant="primary" onClick={handleClose}>Không</Button>
            </Modal.Footer>
        </Modal>
    );

    return (
        <>
            <Header />
            <Card className="bg-light w-100">
                <Card.Title className='text-center text-uppercase alert alert-primary fw-bold mb-3 fs-3'>{id ? "Cập nhật" : "Thêm"} dữ liệu</Card.Title>
                <Card.Body>
                    <Form onSubmit={onHandleSubmit} noValidate>
                        <Row>
                            <Form.Group as={Col} md="12" className="my-3" id='temperature'>
                                <Form.Label className="text-start text-capitalize fw-bolder">Nhiệt độ</Form.Label>
                                <Form.Control
                                    required
                                    type="number"
                                    name="temperature"
                                    placeholder="Nhiệt độ"
                                    value={temperature}
                                    onChange={handleChangeValue}
                                />
                            </Form.Group>

                            <Form.Group as={Col} md="12" className="my-3" id='humidity'>
                                <Form.Label className="text-start text-capitalize fw-bolder">Độ ẩm</Form.Label>
                                <Form.Control
                                    required
                                    type="number"
                                    name="humidity"
                                    placeholder="Độ ẩm"
                                    value={humidity}
                                    onChange={handleChangeValue}
                                />
                            </Form.Group>

                            <Form.Group as={Col} md="12" className="my-3" id="dust">
                                <Form.Label className="text-start text-capitalize fw-bolder">Bụi mịn</Form.Label>
                                <Form.Control
                                    required
                                    type="number"
                                    name="dust"
                                    placeholder="Bụi mịn"
                                    value={dust}
                                    onChange={handleChangeValue}
                                />
                            </Form.Group>

                            <Form.Group as={Col} md="12" className="my-3" id="air">
                                <Form.Label className="text-start text-capitalize fw-bolder">Không khí</Form.Label>
                                <Form.Control
                                    required
                                    type="number"
                                    name="air"
                                    placeholder="Không khí"
                                    value={air}
                                    onChange={handleChangeValue}
                                />
                            </Form.Group>
                        </Row>

                        <Row>
                            <Form.Group as={Col} md="12" className="d-inline-flex flex-row align-items-center justify-content-between">
                                <Button style={{ width: "45%" }} variant="success" type="submit" className="p-1 rounded-pill text-light fs-5 fw-bolder">Lưu</Button>
                                <Button style={{ width: "45%" }} variant="info" type="button" className="p-1 rounded-pill text-light fs-5 fw-bolder" onClick={handleShow}>Hủy</Button>
                            </Form.Group>
                        </Row>
                    </Form>
                </Card.Body>
            </Card>
            {showConfirmCancel()}
        </>
    );
};

export default AddEdit;
