import { StyleSheet, Text, View } from 'react-native';
import { StatusBar } from 'expo-status-bar';
import { useContext, useState, useEffect } from 'react';
import { AuthContext } from '../auth-context';
import { graphqlOperation } from 'aws-amplify';
import { List, DataTable } from 'react-native-paper';

const data = [
    { id: 1, title: 'Survey 1', description: 'Take survey 1' },
    { id: 2, title: 'Survey 2', description: 'Take survey 2' },
    { id: 3, title: 'Survey 3', description: 'Take survey 3' }
];

const CredentialList = ({ list }) => {
    const auth = useContext(AuthContext);
    const [expanded, setExpanded] = useState(true);
    const handlePress = () => setExpanded(!expanded);
    return (
        <List.Section style={styles.list}>
            <List.Accordion
                title="Your surveys"
                left={props => <List.Icon {...props} icon="pen" />}
                expanded={expanded}
                onPress={handlePress}>
                {list.map(item => (
                    <List.Item key={item.id} title={item.title} description={item.description}/>
                ))
                }
            </List.Accordion>
        </List.Section>
    );
};

const History = () => {
    const [page, setPage] = useState(0);
    const [numberOfItemsPerPageList] = useState([2, 3, 4]);
    const [itemsPerPage, onItemsPerPageChange] = useState(
      numberOfItemsPerPageList[0]
    );
  
    const [items] = useState([
     {
       key: 1,
       name: 'Cupcake',
       calories: 356,
       fat: 16,
     },
     {
       key: 2,
       name: 'Eclair',
       calories: 262,
       fat: 16,
     },
     {
       key: 3,
       name: 'Frozen yogurt',
       calories: 159,
       fat: 6,
     },
     {
       key: 4,
       name: 'Gingerbread',
       calories: 305,
       fat: 3.7,
     },
    ]);
  
    const from = page * itemsPerPage;
    const to = Math.min((page + 1) * itemsPerPage, items.length);
  
    useEffect(() => {
      setPage(0);
    }, [itemsPerPage]);
  
    return (
      <DataTable>
        <DataTable.Header>
          <DataTable.Title>Dessert</DataTable.Title>
          <DataTable.Title numeric>Calories</DataTable.Title>
          <DataTable.Title numeric>Fat</DataTable.Title>
        </DataTable.Header>
  
        {items.slice(from, to).map((item) => (
          <DataTable.Row key={item.key}>
            <DataTable.Cell>{item.name}</DataTable.Cell>
            <DataTable.Cell numeric>{item.calories}</DataTable.Cell>
            <DataTable.Cell numeric>{item.fat}</DataTable.Cell>
          </DataTable.Row>
        ))}
  
        <DataTable.Pagination
          page={page}
          numberOfPages={Math.ceil(items.length / itemsPerPage)}
          onPageChange={(page) => setPage(page)}
          label={`${from + 1}-${to} of ${items.length}`}
          numberOfItemsPerPageList={numberOfItemsPerPageList}
          numberOfItemsPerPage={itemsPerPage}
          onItemsPerPageChange={onItemsPerPageChange}
          showFastPaginationControls
          selectPageDropdownLabel={'Rows per page'}
        />
      </DataTable>
    );
  };  

export default function HomeScreen () {
    const auth = useContext(AuthContext)
    console.log(auth)
    return (
        <View style={styles.container}>
            <CredentialList list={data}/>
            <History/>
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
        backgroundColor: '#f4ebf5'
    }
});