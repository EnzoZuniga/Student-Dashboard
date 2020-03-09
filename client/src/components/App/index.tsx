import React from "react";
import "./index.css";
import "antd/dist/antd.css";

import {
  BrowserRouter as Router,
  Switch,
  Route,
  Redirect
} from "react-router-dom";
import Students from "../Students";
import Login from "../Login";
import SignUp from "../SignUp";
import { getToken } from "../../utils/auth";

const PrivateRoute = ({ component: Component, ...rest }: any) => (
  <Route
    {...rest}
    render={props =>
      getToken() !== null ? (
        <Component {...props} />
      ) : (
        <Redirect
          to={{
            pathname: "/signin",
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
          <Route path="/" component={Students} />
          <Route path="/user/:userId" render={() => <div>uuser</div>} />
        </Switch>
      </div>
    </Router>
  );
}

export default App;
