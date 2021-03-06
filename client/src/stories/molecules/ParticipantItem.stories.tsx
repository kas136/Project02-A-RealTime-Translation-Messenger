import React from 'react';
import { Story, Meta } from '@storybook/react/types-6-0';

import ParticipantItem, { ParticipantItemPropsType } from '../../components/molecules/chatRoomPage/ParticipantItem';
import LangCode from '../../@types/langCode';

export default {
  title: 'pupagoMolecule/ParticipantItem',
  component: ParticipantItem,
} as Meta;

const Template: Story<ParticipantItemPropsType> = (args) => <ParticipantItem {...args} />;

export const isMe = Template.bind({});
isMe.args = {
  isMe: true,
  language: LangCode.KOREAN,
  nickname: '닉네임이열두자가되니까요',
  imageLink: 'https://kr.object.ncloudstorage.com/pupago/profiles/profile13.jpg',
};

export const NotMe = Template.bind({});
NotMe.args = {
  isMe: false,
  language: LangCode.ENGLISH,
  nickname: 'whatisthis',
  imageLink: 'https://kr.object.ncloudstorage.com/pupago/profiles/profile13.jpg',
};
