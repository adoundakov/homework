import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';

const preloadedState = {
  notes: [],
  tracks: {},
  isRecording:false,
  isPlaying:false
};


const configureStore = (state = preloadedState) => (
  createStore(
    rootReducer,
    state,
    applyMiddleware(logger)
  )
);

function logger({getState}) {
  return next => action => {
    console.log(getState());
    console.log('dispatching', action);
    let result = next(action);
    console.log('after dispatch', getState());
    return result;
  };
}

export default configureStore;
