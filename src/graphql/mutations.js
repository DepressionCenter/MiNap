/* eslint-disable */
// this is an auto generated file. This will be overwritten

export const createMinapDBEntry = /* GraphQL */ `
  mutation CreateMinapDBEntry(
    $input: CreateMinapDBEntryInput!
    $condition: ModelMinapDBEntryConditionInput
  ) {
    createMinapDBEntry(input: $input, condition: $condition) {
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
export const updateMinapDBEntry = /* GraphQL */ `
  mutation UpdateMinapDBEntry(
    $input: UpdateMinapDBEntryInput!
    $condition: ModelMinapDBEntryConditionInput
  ) {
    updateMinapDBEntry(input: $input, condition: $condition) {
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
export const deleteMinapDBEntry = /* GraphQL */ `
  mutation DeleteMinapDBEntry(
    $input: DeleteMinapDBEntryInput!
    $condition: ModelMinapDBEntryConditionInput
  ) {
    deleteMinapDBEntry(input: $input, condition: $condition) {
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
