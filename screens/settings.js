import { StyleSheet, View, Image } from 'react-native';
import { StatusBar } from 'expo-status-bar';
import { useContext, useState } from 'react';
import { AuthContext } from '../auth-context';
import { Button } from 'react-native-paper';
import { List } from 'react-native-paper';

const CredentialList = () => {
  const auth = useContext(AuthContext);
  const [expanded, setExpanded] = useState(false);
  const handlePress = () => setExpanded(!expanded);


  return (
    <List.Section style={styles.list}>  
      <List.Accordion
        title="Your Credentials"
        left={props => <List.Icon {...props} icon="key" />}
        expanded={expanded}
        onPress={handlePress}>
        <List.Item title="Participant ID" description={auth.participantid}/>
        <List.Item title="Study ID" description={auth.studyid}/>
      </List.Accordion>
    </List.Section>
  );
};

export default function ProfileScreen ({ navigation }) {
    const auth = useContext(AuthContext)
    const handlelogout = () => {
        auth.logout()
        navigation.navigate('Login')
    }
    return (
        <View style={styles.container}>
            <Image style={styles.logo} source={require('../assets/efdc.jpeg')} />
            <CredentialList/>
            <StatusBar style="auto" />
            <Button icon="logout" mode="contained-tonal" style={styles.btn} onPress={handlelogout}>
                Log Out
            </Button>
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
      flex: 1,
      flexDirection: 'column',
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
    },
    logo: {
        width: '70%'
    },
    btn: {
        width: '70%'
    }
});