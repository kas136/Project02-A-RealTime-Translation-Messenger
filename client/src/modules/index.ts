import { combineReducers } from 'redux';

import roomList from './roomList';
import chat from './chat';
import chatInput from './chatInput';
import user from './user';
import participantsList from './participantsList';


const rootReducer = combineReducers({ roomList, participantsList, chat, chatInput, user });

export default rootReducer;
export type RootState = ReturnType<typeof rootReducer>;
