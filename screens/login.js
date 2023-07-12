import { StyleSheet, View, Image } from 'react-native';
import React, { useContext, useState } from 'react';
import { Surface, TextInput, Button, Text } from 'react-native-paper';
import {API, graphqlOperation} from 'aws-amplify';
import {createMinapdb} from '../src/graphql/mutations';
import { listMinapdbs, getMinapdb } from '../src/graphql/queries';
import { AuthContext } from '../auth-context';


export default function LoginScreen ({ navigation }) {
    const [participantid, setParticipantid] = useState({ value: '', error: '' });
    const [studyid, setStudyid] = useState({ value: '', error: '' });
    const auth = useContext(AuthContext)
    async function _onLoginPressed () {
        console.log(participantid)
        console.log(studyid)
    //   try 
    //   {
    //     if (!participantid.value || !studyid.value) return;
    //     const createEntry = {
    //         participantid: parseInt(participantid.value),
    //         studyid: parseInt(studyid.value),
            // sleepSessionStart: 0,
            // sleepSessionEnd: 0,
            // remarks: ""
    //     };
    //     await API.graphql(graphqlOperation(createMinapdb, {input: createEntry}));
    //   }
    //   catch (err) {
    //     console.log('error creating entry:', err);
    //     return;
    //   }
        try 
        {
            if (!participantid.value || !studyid.value) {
                setParticipantid({ value: participantid.value, error: 'participantid and study id can not be empty' });
                setStudyid({ value: studyid.value, error: 'participantid and study id can not be empty' });
                return;
            }
            const userData = await API.graphql(graphqlOperation(getMinapdb, {participantid: parseInt(participantid.value)}));
            // console.log(userData)
            if (userData.data.getMinapdb == null) {
                console.log('participantid does not match');
                setParticipantid({ value: participantid.value, error: 'participantid does not exist' });
                return;
            }
            if (userData.data.getMinapdb.studyid != parseInt(studyid.value)) {
                console.log('studyid does not match');
                setStudyid({ value: studyid.value, error: 'studyid does not match' });
                return;
            }
        }
        catch (err) {
            console.log('error creating entry:', err);
            return;
        }
        auth.login(participantid.value, studyid.value);
        navigation.navigate('AfterInitScreen');
    }
  
    return (
        <View style={styles.container}>
            <Surface style={styles.surface} elevation={4}>
                
                <Image style={styles.logo} source={require('../assets/efdc.jpeg')} />
        
                <TextInput
                label="ParticipantID"
                returnKeyType="next"
                value={participantid.value}
                onChangeText={text => setParticipantid({ value: text, error: '' })}
                error={!!participantid.error}
                errorText={participantid.error}
                keyboardType="numeric"
                />
                {participantid.error ? <Text variant='labelSmall'>{participantid.error}</Text> : null}
        
                <TextInput
                label="StudyID"
                returnKeyType="done"
                value={studyid.value}
                onChangeText={text => setStudyid({ value: text, error: '' })}
                error={!!studyid.error}
                errorText={studyid.error}
                keyboardType="numeric"
                />
                {studyid.error ? <Text variant='labelSmall'>{studyid.error}</Text> : null}
        
                <Button mode="contained" onPress={_onLoginPressed}>
                Login
                </Button>

            </Surface>
        </View>
    );
};  

const styles = StyleSheet.create({
    container: {
        flex: 1,
        width: '100%',
        backgroundColor:'#fff',
        flexDirection: 'column',
        justifyContent: 'center',
        alignItems: 'center'
    },
    logo: {
        width: 200,
        height: 180,
    },
    surface: {
      backgroundColor: '#fff',
      gap: 8,
      padding: 20,
    },
});
