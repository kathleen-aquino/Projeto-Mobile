import React from 'react';
import { View, Text, StyleSheet, TouchableOpacity, StatusBar } from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import LoginScreen from './LoginScreen';
import CadastroScreen from './CadastroScreen';
import PerfilScreen from './PerfilScreen'; 
import BoasVindasScreen from './BoasVindasScreen';


const Stack = createNativeStackNavigator();

function WelcomeScreen({ navigation }) {
  return (
    <View style={styles.container}>
      <StatusBar barStyle="light-content" />
      <Text style={styles.title}>Orpheus</Text>
      <Text style={styles.subtitle}>
        Inspirado pelo deus que encantava com sua lira.
      </Text>

      <View style={styles.buttonGroup}>
        <TouchableOpacity style={styles.button} onPress={() => navigation.navigate('Cadastro')}>
          <Text style={styles.buttonText}>Criar conta</Text>
        </TouchableOpacity>

        <TouchableOpacity style={styles.button} onPress={() => navigation.navigate('Login')}>
          <Text style={styles.buttonText}>Já tenho uma conta</Text>
        </TouchableOpacity>
      </View>

      <Text style={styles.signature}>Orpheus © 2025</Text>
    </View>
  );
}

export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator screenOptions={{ headerShown: false }}>
        <Stack.Screen name="Welcome" component={WelcomeScreen} />
        <Stack.Screen name="Login" component={LoginScreen} />
        <Stack.Screen name="Cadastro" component={CadastroScreen} />
        <Stack.Screen name="Perfil" component={PerfilScreen} />
        <Stack.Screen name="BoasVindas" component={BoasVindasScreen} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#04151F',
    alignItems: 'center',
    justifyContent: 'center',
    padding: 30,
  },
  title: {
    fontSize: 48,
    color: '#EFD6AC',
    fontWeight: 'bold',
    letterSpacing: 2,
    marginBottom: 20,
    fontFamily: 'serif',
  },
  subtitle: {
    fontSize: 18,
    color: '#C44900',
    textAlign: 'center',
    fontStyle: 'italic',
    maxWidth: 300,
    marginBottom: 40,
  },
  buttonGroup: {
    gap: 20,
  },
  button: {
    backgroundColor: '#C44900',
    paddingVertical: 14,
    paddingHorizontal: 40,
    borderRadius: 8,
    borderWidth: 1,
    borderColor: '#432534',
    marginBottom: 10,
    shadowColor: '#000',
    shadowOpacity: 0.3,
    shadowOffset: { width: 0, height: 2 },
    shadowRadius: 4,
  },
  buttonText: {
    color: '#EFD6AC',
    fontSize: 16,
    fontWeight: 'bold',
    letterSpacing: 1,
    textAlign: 'center',
    textAlignVertical: 'center',
  },
  signature: {
    position: 'absolute',
    bottom: 20,
    fontSize: 12,
    color: '#432534',
    fontStyle: 'italic',
  },
});