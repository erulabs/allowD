// @flow

const AllowD = require('../lib/allowd.js')

const allow = new AllowD()

const loginLimits = allow.limit('login', {
  window: '5m',
  maxAddresses: 1,
  minReputation: 0.25
})

loginLimits.event('uniqueToken', 'ipAddress', results => {
  console.log(results)
}).then(results => {
  console.log(results)
})
