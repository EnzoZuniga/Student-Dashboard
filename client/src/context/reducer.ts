export default (state: { currentUser: {} }, { type, payload }: any) => {
  switch (type) {
    case "SIGNIN_USER":
      return {
        ...state,
        currentUser: payload
      };
    case "SIGNOUT_USER":
      return {
        ...state,
        currentUser: null
      };

    default:
      return state;
  }
};
