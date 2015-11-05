# Ron Swanson quotes script for Hubot [![npm version](https://badge.fury.io/js/hubot-swanson.svg)](https://www.npmjs.com/package/hubot-swanson)

A Hubot script that retrieves Ron Swanson quotes from [my API](https://github.com/jamesseanwright/ron-swanson-quotes).

## Installation

Navigate to your Hubot instance's directory and run `npm i hubot-swanson --save`, and add `"hubot-swanson"` to the array in the `external-scripts.json` file. Then simply redeploy your bot.

## Usage

* `hubot swanson me` - retrieves a quote
* `hubot swanson bomb` - output multiple quotes. Configured by `maxBombQuotes`
