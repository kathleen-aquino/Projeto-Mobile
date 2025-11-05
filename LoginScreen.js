import React, { useState } from 'react';
import { View, Text, TextInput, TouchableOpacity, StyleSheet } from 'react-native';

export default function LoginScreen({ navigation }) {
  const [email, setEmail] = useState('');
  const [senha, setSenha] = useState('');
  const [erro, setErro] = useState('');

  const handleLogin = () => {
    if (!email || !senha) {
      setErro('Preencha todos os campos.');
      return;
    }

    if (senha.length < 6) {
      setErro('A senha deve ter pelo menos 6 caracteres.');
      return;
    }

    setErro('');
    navigation.navigate('BoasVindas', {
      origem: 'login',
      usuario: { nome: email },
    });
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Entrar</Text>

      <TextInput
        style={styles.input}
        placeholder="Email ou usuário"
        placeholderTextColor="#EFD6AC"
        value={email}
        onChangeText={setEmail}
      />

      <TextInput
        style={styles.input}
        placeholder="Senha"
        placeholderTextColor="#EFD6AC"
        secureTextEntry
        value={senha}
        onChangeText={setSenha}
      />

      {erro !== '' && <Text style={styles.error}>{erro}</Text>}

      <TouchableOpacity style={styles.button} onPress={handleLogin}>
        <Text style={styles.buttonText}>Entrar</Text>
      </TouchableOpacity>
    </View>
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
    fontSize: 32,
    color: '#EFD6AC',
    fontWeight: 'bold',
    marginBottom: 40,
    fontFamily: 'serif',
  },
  input: {
    width: '100%',
    backgroundColor: '#183A37',
    color: '#EFD6AC',
    padding: 14,
    borderRadius: 8,
    marginBottom: 20,
    fontSize: 16,
  },
  error: {
    color: '#FF6F61',
    fontSize: 14,
    fontStyle: 'italic',
    marginBottom: 20,
    textAlign: 'center',
  },
  button: {
    backgroundColor: '#C44900',
    paddingVertical: 14,
    paddingHorizontal: 40,
    borderRadius: 8,
    borderWidth: 1,
    borderColor: '#432534',
    shadowColor: '#000',
    shadowOpacity: 0.3,
    shadowOffset: { width: 0, height: 2 },
    shadowRadius: 4,
  },
  buttonText: {
    color: '#04151F',
    fontSize: 16,
    fontWeight: 'bold',
    letterSpacing: 1,
    textAlign: 'center',
  },
});