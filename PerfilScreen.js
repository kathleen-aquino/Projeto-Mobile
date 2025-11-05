import React from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  Image,
  TouchableOpacity,
} from 'react-native';
import Icon from 'react-native-vector-icons/FontAwesome';
import { FontAwesome } from '@expo/vector-icons';
export default function PerfilScreen({ navigation }) {
  const nomeUsuario = 'Alice';
  const pfp = require('V:/orpheus/Imagens/alice.jpg');
  const frase = 'Julian, its a hungry world!”';
  const estatisticas = {
    logs: 35,
    seguidores: 3,
    seguindo: 48,
  };

  const albuns = [
    {
      nome: 'As Cores, As Curvas e as Dores do Mundo',
      imagem: require('V:/orpheus/Imagens/As Cores, As Curvas e as Dores do Mundo.jpg'),
    },
    {
      nome: 'Damn',
      imagem: require('V:/orpheus/Imagens/damn.jpg'),
    },
    {
      nome: 'Phobia',
      imagem: require('V:/orpheus/Imagens/f4bd3e46b4642ec20c330cea05efc146.jpg'),
    },
    {
      nome: 'Chocolate Starfish and the Hot Dog Flavored Water',
      imagem: require('V:/orpheus/Imagens/Chocolate Starfish and the Hot Dog Flavored Water.jpg'),
    },
    {
      nome: 'Wonder Whats next',
      imagem: require('V:/orpheus/Imagens/wonder whats next.jpg'),
    },
  ];

  const reviews = [
    {
      musica: 'Caraphernelia - Pierce The Veil',
      comentario: 'Collide invisible lips like a shadow on the wall',
      nota: 3,
    },
    {
      musica: 'Taking Over Me - Evanescence',
      comentario: 'i`ll give up everything just to find you',
      nota: 4,
    },
    {
      musica: 'So Real - Jeff Buckley',
      comentario: 'Love let me sleep tonight in youre couch',
      nota: 5,
    },
  ];

  const amigos = [
    {
      nome: 'Bella Swan',
      imagem: require('./Imagens/Bella.jpg'),
    },
    {
      nome: 'Edward Cullen',
      imagem: require('./Imagens/Edward.jpg'),
    },
    {
      nome: 'Jacob Black',
      imagem: require('./Imagens/jacob.jpg'),
    },
    {
      nome: 'Rosalie Hale',
      imagem: require('./Imagens/Rosalie.jpg'),
    },
    {
      nome: 'Charlie Swan',
      imagem: require('./Imagens/charlie.jpg'),
    },
    {
      nome: 'Carlisle Cullen',
      imagem: require('./Imagens/carlisle.jpg'),
    },
  ];

  return (
    <ScrollView contentContainerStyle={styles.container}>
      <Text style={styles.nome}>{nomeUsuario}</Text>
      <Text style={styles.frase}>{frase}</Text>

      <View style={styles.statsContainer}>
        <View style={styles.statBox}>
          <Text style={styles.statNumber}>{estatisticas.logs}</Text>
          <Text style={styles.statLabel}>Logs</Text>
        </View>
        <View style={styles.statBox}>
          <Text style={styles.statNumber}>{estatisticas.seguidores}</Text>
          <Text style={styles.statLabel}>Seguidores</Text>
        </View>
        <View style={styles.statBox}>
          <Text style={styles.statNumber}>{estatisticas.seguindo}</Text>
          <Text style={styles.statLabel}>Seguindo</Text>
        </View>
      </View>

      <Text style={styles.sectionTitle}>🎧 Álbuns</Text>
      <ScrollView horizontal showsHorizontalScrollIndicator={false}>
        {albuns.map((album, index) => (
          <View key={index} style={styles.albumCard}>
            <Image source={album.imagem} style={styles.albumImage} />
            <Text style={styles.albumNome}>{album.nome}</Text>
          </View>
        ))}
      </ScrollView>
      <Text style={styles.verMais}>ver mais</Text>

      <Text style={styles.sectionTitle}>📝 Minhas Reviews</Text>
      {reviews.map((review, index) => (
        <View key={index} style={styles.reviewCard}>
          <Text style={styles.reviewMusica}>{review.musica}</Text>
          <Text style={styles.reviewTexto}>“{review.comentario}”</Text>
          <View style={styles.stars}>
            {[1, 2, 3, 4, 5].map(n => (
              <FontAwesome
                key={n}
                name="star"
                size={16}
                color={review.nota >= n ? '#FFD700' : '#555'}
              />
            ))}
          </View>
        </View>
      ))}


      <Text style={styles.sectionTitle}>👥 Amigos</Text>
      <ScrollView horizontal showsHorizontalScrollIndicator={false}>
        {amigos.map((amigo, index) => (
          <View key={index} style={styles.friendCard}>
            <Image source={amigo.imagem} style={styles.friendImage} />
            <Text style={styles.friendName}>{amigo.nome}</Text>
          </View>
        ))}
      </ScrollView>

      <View style={styles.buttonGroup}>
        <TouchableOpacity style={styles.button}>
          <Text style={styles.buttonText}>Editar perfil</Text>
        </TouchableOpacity>
        <TouchableOpacity style={styles.button}>
          <Text style={styles.buttonText}>Compartilhar</Text>
        </TouchableOpacity>
      </View>
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    backgroundColor: '#04151F',
    padding: 30,
    alignItems: 'center',
  },
  nome: {
    fontSize: 28,
    color: '#EFD6AC',
    fontWeight: 'bold',
    fontFamily: 'serif',
    marginBottom: 5,
  },
  frase: {
    fontSize: 14,
    fontStyle: 'italic',
    color: '#EFD6AC',
    textAlign: 'center',
    marginBottom: 30,
  },
  statsContainer: {
    flexDirection: 'row',
    justifyContent: 'space-around',
    width: '100%',
    marginBottom: 20,
  },
  statBox: {
    alignItems: 'center',
  },
  statNumber: {
    fontSize: 18,
    color: '#FFD700',
    fontWeight: 'bold',
  },
  statLabel: {
    fontSize: 12,
    color: '#EFD6AC',
  },
  sectionTitle: {
    fontSize: 20,
    color: '#EFD6AC',
    fontWeight: 'bold',
    marginTop: 20,
    marginBottom: 10,
    fontFamily: 'serif',
  },
  albumCard: {
    backgroundColor: '#183A37',
    padding: 10,
    borderRadius: 8,
    marginRight: 12,
    alignItems: 'center',
    width: 120,
  },
  albumImage: {
    width: 80,
    height: 80,
    borderRadius: 8,
    marginBottom: 5,
  },
  albumNome: {
    color: '#FFD700',
    fontSize: 12,
    textAlign: 'center',
    fontFamily: 'serif',
  },
  verMais: {
    color: '#C44900',
    fontSize: 12,
    marginTop: 5,
    alignSelf: 'flex-end',
  },
  reviewCard: {
    backgroundColor: '#183A37',
    padding: 15,
    borderRadius: 8,
    marginBottom: 15,
    width: '100%',
  },
  reviewMusica: {
    color: '#FFD700',
    fontSize: 14,
    fontWeight: 'bold',
    marginBottom: 5,
    fontFamily: 'serif',
  },
  reviewTexto: {
    color: '#EFD6AC',
    fontSize: 13,
    fontStyle: 'italic',
    marginBottom: 10,
    fontFamily: 'serif',
  },
  stars: {
    flexDirection: 'row',
  },
  feitoContainer: {
    alignItems: 'center',
    marginBottom: 20,
  },
  feitoLabel: {
    color: '#C44900',
    fontSize: 14,
    fontStyle: 'italic',
    marginVertical: 8,
    fontFamily: 'serif',
  },
  circles: {
    flexDirection: 'row',
    gap: 10,
  },
  circle: {
    width: 20,
    height: 20,
    borderRadius: 10,
    backgroundColor: '#C44900',
    marginHorizontal: 5,
  },
  friendCard: {
    alignItems: 'center',
    marginRight: 15,
  },
  friendImage: {
    width: 60,
    height: 60,
    borderRadius: 30,
    marginBottom: 5,
  },
  PfpImage: {
    width: 60,
    alignItems: 'center',
    height: 60,
    borderRadius: 30,
    marginBottom: 5,
  },
  friendName: {
    color: '#EFD6AC',
    fontSize: 12,
    textAlign: 'center',
    fontFamily: 'serif',
  },
 buttonGroup: {
  flexDirection: 'row',
  gap: 20,
  marginTop: 30,
  marginBottom: 40, // ✅ valor adicionado
},
button: {
  backgroundColor: '#C44900',
  paddingVertical: 12,
  paddingHorizontal: 20,
  borderRadius: 8,
  borderWidth: 1,
  borderColor: '#432534',
},
buttonText: {
  color: '#04151F',
  fontSize: 14,
  fontWeight: 'bold',
  letterSpacing: 1,
},
});