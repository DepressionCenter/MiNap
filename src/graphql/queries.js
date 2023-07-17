/* eslint-disable */
// this is an auto generated file. This will be overwritten

export const getMinapDBAuth = /* GraphQL */ `
  query GetMinapDBAuth($id: ID!) {
    getMinapDBAuth(id: $id) {
      id
      studyid
      participantid
      createdAt
      updatedAt
      _version
      _deleted
      _lastChangedAt
      __typename
    }
  }
`;
export const listMinapDBAuths = /* GraphQL */ `
  query ListMinapDBAuths(
    $filter: ModelMinapDBAuthFilterInput
    $limit: Int
    $nextToken: String
  ) {
    listMinapDBAuths(filter: $filter, limit: $limit, nextToken: $nextToken) {
      items {
        id
        studyid
        participantid
        createdAt
        updatedAt
        _version
        _deleted
        _lastChangedAt
        __typename
      }
      nextToken
      startedAt
      __typename
    }
  }
`;
export const syncMinapDBAuths = /* GraphQL */ `
  query SyncMinapDBAuths(
    $filter: ModelMinapDBAuthFilterInput
    $limit: Int
    $nextToken: String
    $lastSync: AWSTimestamp
  ) {
    syncMinapDBAuths(
      filter: $filter
      limit: $limit
      nextToken: $nextToken
      lastSync: $lastSync
    ) {
      items {
        id
        studyid
        participantid
        createdAt
        updatedAt
        _version
        _deleted
        _lastChangedAt
        __typename
      }
      nextToken
      startedAt
      __typename
    }
  }
`;
export const getMinapDBEntry = /* GraphQL */ `
  query GetMinapDBEntry($id: ID!) {
    getMinapDBEntry(id: $id) {
      id
      sleepSessionStart
      sleepSessionEnd
      studyid
      remarks
      participantid
      createdAt
      updatedAt
      _version
      _deleted
      _lastChangedAt
      __typename
    }
  }
`;
export const listMinapDBEntries = /* GraphQL */ `
  query ListMinapDBEntries(
    $filter: ModelMinapDBEntryFilterInput
    $limit: Int
    $nextToken: String
  ) {
    listMinapDBEntries(filter: $filter, limit: $limit, nextToken: $nextToken) {
      items {
        id
        sleepSessionStart
        sleepSessionEnd
        studyid
        remarks
        participantid
        createdAt
        updatedAt
        _version
        _deleted
        _lastChangedAt
        __typename
      }
      nextToken
      startedAt
      __typename
    }
  }
`;
export const syncMinapDBEntries = /* GraphQL */ `
  query SyncMinapDBEntries(
    $filter: ModelMinapDBEntryFilterInput
    $limit: Int
    $nextToken: String
    $lastSync: AWSTimestamp
  ) {
    syncMinapDBEntries(
      filter: $filter
      limit: $limit
      nextToken: $nextToken
      lastSync: $lastSync
    ) {
      items {
        id
        sleepSessionStart
        sleepSessionEnd
        studyid
        remarks
        participantid
        createdAt
        updatedAt
        _version
        _deleted
        _lastChangedAt
        __typename
      }
      nextToken
      startedAt
      __typename
    }
  }
`;
