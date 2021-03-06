import React from 'react';
import { Story, Meta } from '@storybook/react/types-6-0';

import LanguageTag, { LanguageTagPropsType } from '../../components/atoms/resources/LanguageTag';
import LangCode from '../../@types/langCode';

export default {
  title: 'pupagoAtom/LanguageTag',
  component: LanguageTag,
} as Meta;

const Template: Story<LanguageTagPropsType> = (args) => <LanguageTag {...args} />;

export const Active = Template.bind({});
Active.args = {
  language: LangCode.KOREAN,
  isMe: true,
};

export const Disabled = Template.bind({});
Disabled.args = {
  language: LangCode.ENGLISH,
  isMe: false,
};
