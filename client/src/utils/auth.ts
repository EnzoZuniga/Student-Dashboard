const TOKEN_KEY: string = "token";

export const setToken = (value: any, tokenKey: string = TOKEN_KEY) => {
  if (localStorage) {
    localStorage.setItem(tokenKey, JSON.stringify(value));
  }
};

export const getToken = (tokenKey: string | null = TOKEN_KEY) => {
  if (localStorage && localStorage.getItem(tokenKey!)) {
    const token = localStorage.getItem(tokenKey!);
    return JSON.parse(token!);
  }
  return null;
};

export const clearToken = (tokenKey: string = TOKEN_KEY) => {
  if (localStorage) {
    return localStorage.removeItem(tokenKey);
  }
};
