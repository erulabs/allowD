// @flow

type Limit = {
  event: Function
}
type EventResult = {
  type: string
}

class AllowD {
  constructor (serviceOptions?: Object): void {
    console.log('allowd')
  }
  limit (key: string, options: Object): Limit {
    function event (token: string | number, ipAddress: string | number, callback?: Function): Promise<EventResult> {
      return new Promise((resolve, reject) => {
        const result = {
          type: 'abuse'
        }
        resolve(result)
        if (callback) callback(result)
      })
    }
    return { event }
  }
}

module.exports = AllowD
