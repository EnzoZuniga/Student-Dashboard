import React from "react";
import "./index.css";
import "antd/dist/antd.css";

import {
  BrowserRouter as Router,
  Switch,
  Route,
  Redirect
} from "react-router-dom";
import Home from "../Students";
import Login from "../Login";
import SignUp from "../SignUp";
import { getToken } from "../../utils/auth";

const PrivateRoute = ({ component: Component, ...props }: any) => (
  <Route
    {...props}
    render={props =>
      getToken() !== null ? (
        <Component {...props} />
      ) : (
        <Redirect
          to={{
            pathname: "/login",
            state: { from: props.location }
          }}
        />
      )
    }
  />
);

function App() {
  return (
    <Router>
      <div>
        <Switch>
          <Route path="/login" component={Login} />

          <Route path="/signUp" component={SignUp} />

          <PrivateRoute path="/" component={Home} />
        </Switch>
      </div>
    </Router>
  );
}

export default App;
