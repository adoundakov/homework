import React from 'react';
import ReactDOM from 'react-dom';

import Note from './util/note.js';

import configureStore from './store/store';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  // const newStore = applyMiddlewares(store, addLoggingToDispatch);
  const rootEl = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, rootEl);
});


// not going to be used once we implement redux's middlewares function
const addLoggingToDispatch = store => next => action => {
  let dispatch = store.dispatch;
  console.log(store.getState());
  console.log(action);
  let result = dispatch(action);
  console.log(store.getState());
  return result;
};

const applyMiddlewares = (store, ...middlewares) => {
  let dispatch = store.dispatch;
  middlewares.forEach((middleware) => {
    dispatch = middleware(store)(dispatch);
  });
  return Object.assign({}, store, {dispatch});
};
