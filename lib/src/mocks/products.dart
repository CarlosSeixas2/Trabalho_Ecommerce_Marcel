List<Map<String, dynamic>> produtos = [
  {
    "id": 1,
    "nome": "Notebook",
    "descricao": "Notebook ultrafino com SSD",
    "preco": 999.99,
    "quantidade": 5
  },
  {
    "id": 2,
    "nome": "Mouse",
    "descricao": "Mouse óptico sem fio",
    "preco": 19.99,
    "quantidade": 50
  },
  {
    "id": 3,
    "nome": "Teclado",
    "descricao": "Teclado mecânico RGB",
    "preco": 59.99,
    "quantidade": 30
  },
  {
    "id": 4,
    "nome": "Monitor",
    "descricao": "Monitor LED 24 polegadas",
    "preco": 199.99,
    "quantidade": 20
  },
  {
    "id": 5,
    "nome": "Placa de Vídeo RTX 4050",
    "descricao": "Placa de vídeo NVIDIA GeForce RTX 3060",
    "preco": 499.99,
    "quantidade": 10
  }
];

class ProductsMock {
  static List<Map<String, dynamic>> getProducts() {
    return produtos;
  }

  static Map<String, dynamic> getProductById(int id) {
    return produtos.firstWhere((produto) => produto['id'] == id);
  }
}