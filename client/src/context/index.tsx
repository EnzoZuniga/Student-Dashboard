import React, { createContext, useContext, useReducer, useState } from "react";

export const AuthContext = createContext({});

function ContextProvider(props: any): JSX.Element {
  const [currentUser, setCurrentUser] = useState(null);

  function getCurrentUser(user: any) {
    setCurrentUser(user);
  }

  return (
    <AuthContext.Provider value={{ currentUser, getCurrentUser }}>
      {props.children}
    </AuthContext.Provider>
  );
}

export default ContextProvider;
