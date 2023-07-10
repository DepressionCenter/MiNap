import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack'
import { createMaterialBottomTabNavigator } from '@react-navigation/material-bottom-tabs';
import Ionicons from 'react-native-vector-icons/Ionicons';

import HomeScreen from 'minap/screens/home.js'
import ProfileScreen from 'minap/screens/settings.js'

import Amplify from 'aws-amplify';
import aws_config from "./src/aws-exports";

Amplify.configure(aws_config);
const HomeStack = createNativeStackNavigator();

function HomeStackScreen() {
  return (
    <HomeStack.Navigator>
      <HomeStack.Screen name="Dashboard" component={HomeScreen} />
    </HomeStack.Navigator>
  );
}

const SettingsStack = createNativeStackNavigator();

function ProfileStackScreen() {
  return (
    <SettingsStack.Navigator>
      <SettingsStack.Screen name="Settings" component={ProfileScreen} />
    </SettingsStack.Navigator>
  );
}

const Tab = createMaterialBottomTabNavigator();

export default function App() {
  var mysql = require('mysql');

  var connection = mysql.createConnection({
    host     : process.env.RDS_HOSTNAME,
    user     : process.env.RDS_USERNAME,
    password : process.env.RDS_PASSWORD,
    port     : process.env.RDS_PORT
  });

  connection.connect(function(err) {
    if (err) {
      console.error('Database connection failed: ' + err.stack);
      return;
    }
  
    console.log('Connected to database.');
  });
  
  connection.end();

  return (
    <NavigationContainer>
      <Tab.Navigator 
        initialRouteName="App"
        activeColor="#6b3acf"
        inactiveColor="#3e2469"
        screenOptions={({ route }) => ({
        tabBarIcon: ({ focused, color, size }) => {
          let iconName;
          size = 20;

          if (route.name === 'Main') {
            if (focused) {
              iconName = 'ios-information-circle'
              size += 5
            }
            else {
              iconName = 'ios-information-circle-outline'
            }
          } else if (route.name === 'Profile') {
            if (focused) {
              iconName = 'ios-list'
              size += 5
            }
            else
            {
              iconName = 'ios-list-outline'
            }
          }

          // You can return any component that you like here!
          return <Ionicons name={iconName} size={size} color={color} />;
        },
        tabBarActiveTintColor: 'tomato',
        tabBarInactiveTintColor: 'black',
        })}
        barStyle={{ 
          backgroundColor: '#e6e1f2',
          alignItems: 'center',
          justifyContent: 'center',
          height: 60,
        }}
        shifting={true}
        >
          <Tab.Screen name="Main" component={HomeStackScreen}/>
          <Tab.Screen name="Profile" component={ProfileStackScreen}/>
      </Tab.Navigator>
    </NavigationContainer>
  );
}