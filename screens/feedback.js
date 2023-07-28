import React, { useState } from 'react';
import { StyleSheet, View, ScrollView } from 'react-native';
import { Surface, RadioButton, TextInput, Button, Text } from 'react-native-paper';
import { updateMinapDBEntry } from '../src/graphql/mutations';
import { API } from 'aws-amplify';

const FeedbackScreen = ({ route, navigation }) => {
  const [sleepQuality, setSleepQuality] = useState('');
  const [interruption, setInterruption] = useState('');
  const [caffeineConsumed, setCaffeineConsumed] = useState('');
  const [alcoholConsumed, setAlcoholConsumed] = useState('');
  const [additionalFeedback, setAdditionalFeedback] = useState('');
  const [errorMsg, setErrorMsg] = useState('')
  const { id } = route.params

  async function submitFeedback() {
    if (sleepQuality === '' || interruption === '' || caffeineConsumed === '' || alcoholConsumed === '') {
      setErrorMsg('Please answer all mandatory questions.');
      return;
    }

    console.log('Sleep Quality:', sleepQuality);
    console.log('Interruption:', interruption);
    console.log('Caffeine Consumed:', caffeineConsumed);
    console.log('Alcohol Consumed:', alcoholConsumed);
    console.log('Additional Feedback:', additionalFeedback);

    const surveyObj = {
      "sleep-quality": sleepQuality,
      "interruption": interruption,
      "caffeine-consumed": caffeineConsumed,
      "alcohol-consumed": alcoholConsumed,
      "additional-feedback": additionalFeedback
    }

    try {
      const updateSession = {
        id: id,
        remarks: JSON.stringify(surveyObj)
      }

      const update = await API.graphql({
        query: updateMinapDBEntry,
        variables: {input: updateSession }
      });
      console.log(update)
    }
    catch (err) {
      console.log('error creating entry:', err);
      return;
  }

    setSleepQuality('');
    setInterruption('');
    setCaffeineConsumed('');
    setAlcoholConsumed('');
    setAdditionalFeedback('');
    setErrorMsg('');
    navigation.navigate('Dashboard', { surveyMsg: id })
  };

  const skipFeedback = () => {
    console.log('User chose to skip the feedback.');

    setSleepQuality('');
    setInterruption('');
    setCaffeineConsumed('');
    setAlcoholConsumed('');
    setAdditionalFeedback('');
    setErrorMsg('');
    navigation.navigate('Dashboard')
  };

  return (
    <ScrollView>
      <View style={styles.container}>
        <Surface style={styles.surface} elevation={4}>
          <Text style={styles.header}>Feedback Form </Text>
          
          {/* Question 1 */}
          <Text style={styles.question}>
            Question 1* How well did you sleep?
            <Text style={styles.redAsterisk}>*</Text>
          </Text>
          {errorMsg? <Text variant='labelSmall' style={styles.errtxt}>{errorMsg}</Text>:''}
          <RadioButton.Group onValueChange={value => setSleepQuality(value)} value={sleepQuality}>
            <RadioButton.Item label="Good" value="good" />
            <RadioButton.Item label="Average" value="average" />
            <RadioButton.Item label="Bad" value="bad" />
          </RadioButton.Group>

          {/* Question 2 */}
          <Text style={styles.question}>
            Question 2* Did you face any interruption in between the sleep session? Did you wake up in between?
            <Text style={styles.redAsterisk}>*</Text>
          </Text>
          {errorMsg? <Text variant='labelSmall' style={styles.errtxt}>{errorMsg}</Text>:''}
          <RadioButton.Group onValueChange={value => setInterruption(value)} value={interruption}>
            <RadioButton.Item label="Yes" value="yes" />
            <RadioButton.Item label="No" value="no" />
          </RadioButton.Group>

          {/* Question 3 */}
          <Text style={styles.question}>
            Question 3* Did you consume caffeine prior to sleeping?
            <Text style={styles.redAsterisk}>*</Text>
          </Text>
          {errorMsg? <Text variant='labelSmall' style={styles.errtxt}>{errorMsg}</Text>:''}
          <RadioButton.Group onValueChange={value => setCaffeineConsumed(value)} value={caffeineConsumed}>
            <RadioButton.Item label="Yes" value="yes" />
            <RadioButton.Item label="No" value="no" />
          </RadioButton.Group>

          {/* Question 4 */}
          <Text style={styles.question}>
            Question 4* Did you consume alcohol before sleeping?
            <Text style={styles.redAsterisk}>*</Text>
          </Text>
          {errorMsg? <Text variant='labelSmall' style={styles.errtxt}>{errorMsg}</Text>:''}
          <RadioButton.Group onValueChange={value => setAlcoholConsumed(value)} value={alcoholConsumed}>
            <RadioButton.Item label="Yes" value="yes" />
            <RadioButton.Item label="No" value="no" />
          </RadioButton.Group>

          {/* Question 5 */}
          <Text style={styles.question}>Question 5. Any additional feedback?</Text>
          <TextInput
            multiline
            value={additionalFeedback}
            onChangeText={text => setAdditionalFeedback(text)}
          />

          {/* Submit and Skip Buttons */}
          <View style={styles.buttonsContainer}>
            <Button mode="contained" onPress={submitFeedback}>
              Submit
            </Button>
            <Button mode="outlined" onPress={skipFeedback}>
              Skip
            </Button>
          </View>
        </Surface>
      </View>
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    width: '100%',
    backgroundColor: '#fff',
    flexDirection: 'column',
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: 26
  },
  surface: {
    backgroundColor: '#fff',
    padding: 20,
    width: '80%',
    elevation: 4,
  },
  header: {
    fontSize: 20,
    fontWeight: 'bold',
    marginBottom: 16,
    textAlign: 'center',
  },
  question: {
    fontSize: 16,
    marginBottom: 8,
  },
//   for madatory questions
  redAsterisk: {
    color: 'red',
  },
  buttonsContainer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginTop: 16,
  },
  errtxt: {
    color: 'red'
  }
});

export default FeedbackScreen;
