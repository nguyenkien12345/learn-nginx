import axios from 'axios';

const axiosClient = axios.create({
    baseURL: 'https://thcntt3.onrender.com',
    headers: {
        'Content-Type': 'application/json',
    },
});

export default axiosClient;
