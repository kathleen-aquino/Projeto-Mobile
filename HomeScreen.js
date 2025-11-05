import React from 'react';
import { View, Text, StyleSheet } from 'react-native';

export default function HomeScreen({ route }) {
  const origem = route.params?.origem;

  const mensagem =
    origem === 'cadastro'
      ? 'Conta criada com sucesso. Que sua playlist interior comece a tocar.'
      : 'Login realizado. O palco é seu.';

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Bem-vindo ao Orpheus</Text>
      <Text style={styles.subtitle}>{mensagem}</Text>
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
    marginBottom: 20,
    fontFamily: 'serif',
    textAlign: 'center',
  },
  subtitle: {
    fontSize: 18,
    color: '#C44900',
    textAlign: 'center',
    fontStyle: 'italic',
  },
});