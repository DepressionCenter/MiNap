import { ScrollView, StyleSheet, Text, View } from 'react-native';
import { StatusBar } from 'expo-status-bar';
import { useContext, useState, useEffect } from 'react';
import { AuthContext } from '../auth-context';
import { API, graphqlOperation } from 'aws-amplify';
import { List, DataTable, Badge } from 'react-native-paper';
import { onCreateMinapDBEntry, onDeleteMinapDBEntry } from '../src/graphql/subscriptions'
import { listMinapDBEntries } from '../src/graphql/queries';


const CredentialList = ({ list, navigation, surveyMsg }) => {
    const auth = useContext(AuthContext);
    const [expanded, setExpanded] = useState(false);
    const handlePress = () => setExpanded(!expanded);
    const [surveyList, setSurveyList] = useState([]);
    const past_time = new Date(Date.now() - 60*60*1000).toISOString();

    const variables = {
      filter: {
        and: [
          { participantid: { eq: auth.participantid } },
          { studyid: { eq: auth.studyid } },
          { sleepSessionEnd: { ge: past_time } },
          { remarks: { attributeExists: false } }
        ]
      }
    };
    
    // subscribes to sleep entry creation
    useEffect(() => {
      API.graphql({
        query: listMinapDBEntries,
        variables: variables
      })
      .then(response => {
        console.log("filter initial result")
        var newList = []
        const fetchedItems = response.data.listMinapDBEntries.items
        for (var i = 0; i < fetchedItems.length; i++) {
          const listItem = {
            id: fetchedItems[i].id,
            title: "Ended at " + fetchedItems[i]["sleepSessionEnd"],
            description: 'Take this survey. Expires within 1 h',
            record: fetchedItems[i]["sleepSessionEnd"]
          }
          newList.push(listItem);
        }

        setSurveyList(newList)
      })
      .catch(err => console.log(err));

      const sub = API.graphql(
          graphqlOperation(onCreateMinapDBEntry)
      ).subscribe({
          next: ({ provider, value }) => {
              const sessionObj = value.data.onCreateMinapDBEntry
              console.log(sessionObj)
              const awsDate = new Date(sessionObj.sleepSessionEnd);
              const dateString = awsDate.toISOString();
              const listItem = {
                  id: sessionObj.id,
                  title: "Ended at  " + dateString,
                  description: 'Take this survey. Expires within 1 hr',
                  record: dateString
              }
              setSurveyList(prevList => Array.isArray(prevList) ? prevList.concat(listItem) : [listItem])
          },
          error: (error) => console.warn(error)
      });
      
      // subcribes to data entry deletion during database sync
      const subdel = API.graphql(
        graphqlOperation(onDeleteMinapDBEntry)
        ).subscribe({
            next: ({ provider, value }) => {
                // console.log({ provider, value })
                const sessionObj = value.data.onDeleteMinapDBEntry
                console.log(sessionObj.id)
                setSurveyList(prevList => Array.isArray(prevList) ? prevList.filter(item => item.id !== sessionObj.id) : [])
                console.log(surveyList)
            },
            error: (error) => console.warn(error)
        });
  
      // Clean up subscription on unmount
      return () => {
        sub.unsubscribe();
        subdel.unsubscribe();
      }
      }, []);
    
    return (
      <List.Section style={styles.list}>
        <List.Accordion
            title="Your surveys"
            left={props => <List.Icon {...props} icon="pen" />}
            right={() => <Badge>{ surveyList.length } </Badge>}
            expanded={expanded}
            onPress={handlePress}>
            {Array.isArray(surveyList) && surveyList.map(item => (
                <List.Item key={item.id} title={item.title} description={item.description} onPress={()=>navigation.navigate('Survey', {'id': item.id})}/>
            ))
            }
        </List.Accordion>
      </List.Section>
    );
};

const History = () => {
    const [page, setPage] = useState(0);
    const [numberOfItemsPerPageList] = useState([5, 6, 7, 8, 9, 10]);
    const [itemsPerPage, onItemsPerPageChange] = useState(
      numberOfItemsPerPageList[0]
    );
    const [surveyList, setSurveyList] = useState([]);
  
    const from = page * itemsPerPage;
    const to = Math.min((page + 1) * itemsPerPage, surveyList.length);
  
    useEffect(() => {
      setPage(0);
      API.graphql({
        query: listMinapDBEntries
      })
      .then(response => {
        console.log("filter initial result")
        var newList = []
        const fetchedItems = response.data.listMinapDBEntries.items
        for (var i = 0; i < fetchedItems.length; i++) {
          const listItem = {
            id: fetchedItems[i].id,
            end: fetchedItems[i]["sleepSessionEnd"],
            start: fetchedItems[i]["sleepSessionEnd"]
          }
          newList.push(listItem);
        }
        setSurveyList(newList.sort((a, b) => b.end.localeCompare(a.end)))
      })
      .catch(err => console.log(err));

      const sub = API.graphql(
        graphqlOperation(onCreateMinapDBEntry)
        ).subscribe({
            next: ({ provider, value }) => {
                const sessionObj = value.data.onCreateMinapDBEntry
                console.log(sessionObj)
                const end = new Date(sessionObj.sleepSessionEnd);
                const endDateString = end.toISOString();
                const start = new Date(sessionObj.sleepSessionStart);
                const startDateString = start.toISOString();
                const listItem = {
                    id: sessionObj.id,
                    start: startDateString,
                    end: endDateString
                }
                setSurveyList(prevList => Array.isArray(prevList) ? prevList.concat(listItem) : [listItem])
            },
            error: (error) => console.warn(error)
        });

        return () => sub.unsubscribe();
    }, [itemsPerPage]);
  
    return (
      <DataTable style={styles.datatable}>
        <DataTable.Header>
          <DataTable.Title>Session Start</DataTable.Title>
          <DataTable.Title>Session End</DataTable.Title>
        </DataTable.Header>
  
        {surveyList.slice(from, to).map((item) => (
          <DataTable.Row key={item.id}>
            <DataTable.Cell numeric>{item.start}</DataTable.Cell>
            <DataTable.Cell numeric>{item.end}</DataTable.Cell>
          </DataTable.Row>
        ))}
  
        <DataTable.Pagination
          page={page}
          numberOfPages={Math.ceil(surveyList.length / itemsPerPage)}
          onPageChange={(page) => setPage(page)}
          label={`${from + 1}-${to} of ${surveyList.length}`}
          numberOfItemsPerPageList={numberOfItemsPerPageList}
          numberOfItemsPerPage={itemsPerPage}
          onItemsPerPageChange={onItemsPerPageChange}
          showFastPaginationControls
          selectPageDropdownLabel={'Rows per page'}
        />
      </DataTable>
    );
  };  

export default function HomeScreen ({navigation, route }) {
    const auth = useContext(AuthContext)
    const { surveyMsg } = route.params ?? { surveyMsg: null }
    console.log(surveyMsg)
    console.log(auth)
    return (
        <View style={styles.container}>
            <ScrollView>
              <CredentialList navigation={navigation} surveyMsg={surveyMsg}/>
              <History/>
            </ScrollView>
            <StatusBar style="auto" />
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
      flex: 1,
      backgroundColor: '#fff',
      alignItems: 'center',
      justifyContent: 'flex-start',
      width: '100%',
      paddingTop: '5%',
      gap: 10
    },
    list: {
        width: '100%',
        backgroundColor: '#f4ebf5',
        overflow: 'scroll'
    },
    datatable: {
      marginBottom: 16
    }
});