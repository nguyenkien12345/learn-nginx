import axiosClient from './axiosClient';

const dataApi = {
    // params: có thể là search, filter, paging, page...
    getAll(params) {
        const url = '/list';
        return axiosClient.get(url, { params: params });
    },

    getDetail(id) {
        const url = `/detail/${id}`;
        return axiosClient.get(url);
    },

    add(data) {
        const url = '/add-data';
        return axiosClient.post(url, data);
    },

    update(data) {
        const url = `/update`;
        return axiosClient.put(url, data);
    },

    remove(id) {
        const url = `/delete/${id}`;
        return axiosClient.delete(url);
    },
};

export default dataApi;
