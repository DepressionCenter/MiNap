import { StyleSheet, View, Image } from 'react-native';
import React, { useState } from 'react';
import { Surface, TextInput, Button } from 'react-native-paper';


export default function LoginScreen ({ navigation }) {
    const [participantid, setParticipantid] = useState({ value: '', error: '' });
    const [studyid, setStudyid] = useState({ value: '', error: '' });
  
    const _onLoginPressed = () => {
      console.log(participantid)
      console.log(studyid)
      navigation.navigate('AfterInitScreen');
    };
  
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
        
                <TextInput
                label="StudyID"
                returnKeyType="done"
                value={studyid.value}
                onChangeText={text => setStudyid({ value: text, error: '' })}
                error={!!studyid.error}
                errorText={studyid.error}
                keyboardType="numeric"
                />
        
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
