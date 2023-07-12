import { StyleSheet, Text, View } from 'react-native';
import { StatusBar } from 'expo-status-bar';
import { useContext } from 'react';
import { AuthContext } from '../auth-context';

export default function HomeScreen () {
    const auth = useContext(AuthContext)
    console.log(auth)
    return (
        <View style={styles.container}>
            <Text>Home Page</Text>
            <Text> ParticipantID: {auth.participantid} </Text>
            <Text> StudyID: {auth.studyid} </Text>
            <StatusBar style="auto" />
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
      flex: 1,
      backgroundColor: '#fff',
      alignItems: 'center',
      justifyContent: 'center',
    },
});