import React, { createContext, useContext, useReducer } from "react";
import reducer from "./reducer";

const AuthContext = createContext<{ currentUser: any }>({
  currentUser: null
});

function ContextProvider(props: any): JSX.Element {
  const initialState = useContext(AuthContext);
  const [state, dispatch] = useReducer(reducer, initialState);
  return (
    <AuthContext.Provider value={{ state, dispatch }}>
      {props.children}
    </AuthContext.Provider>
  );
}

export default ContextProvider;
