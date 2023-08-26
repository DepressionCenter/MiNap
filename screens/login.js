import { StyleSheet, View, Image } from 'react-native';
import React, { useContext, useState } from 'react';
import { Surface, TextInput, Button, Text } from 'react-native-paper';
import { API, graphqlOperation } from 'aws-amplify';
import { listMinapDBAuths } from '../src/graphql/queries'
import { AuthContext } from '../auth-context';


export default function LoginScreen ({ navigation }) {
    const [participantid, setParticipantid] = useState({ value: '', error: '' });
    const [studyid, setStudyid] = useState({ value: '', error: '' });
    const auth = useContext(AuthContext)
    async function _onLoginPressed () {
        console.log(participantid)
        console.log(studyid)
        try 
        {
            if (!participantid.value || !studyid.value) {
                setParticipantid({ value: participantid.value, error: 'participantid and study id can not be empty' });
                setStudyid({ value: studyid.value, error: 'participantid and study id can not be empty' });
                return;
            }

            // create filter for user data retrieval
            const variables = {
                filter: {
                    participantid: { eq: participantid.value }
                }
            };

            //retrieve auth info
            userData = await API.graphql(graphqlOperation(listMinapDBAuths, variables));
            console.log(userData.data.listMinapDBAuths.items);
            if (userData.data.listMinapDBAuths.items.length == 0) {
                setParticipantid({ value: participantid.value, error: 'participantid does not exist' });
                return;
            }
            else {
                if (userData.data.listMinapDBAuths.items[0]["studyid"] != studyid.value) {
                    setStudyid({ value: studyid.value, error: 'participantid and studyid does not match' });
                    return;
                }
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
