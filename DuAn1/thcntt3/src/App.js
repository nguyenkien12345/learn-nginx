import React from 'react';
// Router
import { Route, Switch } from 'react-router-dom';
// Components
import Home from './components/Home';
import AddEdit from './components/AddEdit';
import View from './components/View';
import About from './components/About';
import Faq from './components/Faq';
import NotFound from './components/NotFound';
// Toast
import { ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
// Bootstrap
import 'bootstrap/dist/css/bootstrap.css';
import { Container } from 'react-bootstrap';

const App = () => {
  return (
    <>
      <Container className='d-flex flex-column align-items-center bg-light p-5 mt-5'>
        <ToastContainer
          position='top-center'
          autoClose={1500}
          hideProgressBar={false}
          newestOnTop={false}
          closeOnClick
          // hiển thị icon message progressbar theo chiều từ phải sang trái
          rtl={false}
          theme="light"
        />
        <Switch>
          <Route exact path='/' component={Home} />
          <Route path='/detail/:id' component={View} />
          <Route path='/add' component={AddEdit} />
          <Route path='/edit/:id' component={AddEdit} />
          <Route path='/about' component={About} />
          <Route path='/faq' component={Faq} />
          <Route component={NotFound} />
        </Switch>
      </Container>
    </>
  );
}

export default App;
