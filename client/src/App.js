import React from 'react';
import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Route, Link} from 'react-router-dom';
import OtherPage from './OtherPage';
import Fib from './Fib';

function App() {
  return (
    <Router>
      <div className="App">
        <img src={logo} className="App-logo" alt="logo" />
        <h1 className="App-title">Fib Calculator version 2</h1>
        <Link to="/">Home</Link> | 
        <Link to="/otherpage">Other Page</Link>
        <Route exact path="/" component={Fib} />
        <Route path="/otherpage" component={OtherPage}/>
      </div>
    </Router>
  );
}

export default App;
