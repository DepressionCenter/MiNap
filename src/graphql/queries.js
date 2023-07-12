/* eslint-disable */
// this is an auto generated file. This will be overwritten

export const getMinapdb = /* GraphQL */ `
  query GetMinapdb($participantid: Int!) {
    getMinapdb(participantid: $participantid) {
      participantid
      sleepSessionStart
      sleepSessionEnd
      studyid
      remarks
      __typename
    }
  }
`;
export const listMinapdbs = /* GraphQL */ `
  query ListMinapdbs(
    $filter: TableMinapdbFilterInput
    $limit: Int
    $nextToken: String
  ) {
    listMinapdbs(filter: $filter, limit: $limit, nextToken: $nextToken) {
      items {
        participantid
        sleepSessionStart
        sleepSessionEnd
        studyid
        remarks
        __typename
      }
      nextToken
      __typename
    }
  }
`;
