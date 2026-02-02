# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# ============================================
# TIPOS DE VEÍCULOS
# ============================================
puts "Criando tipos de veículos..."

tipos_veiculos = [
  { descricao: "Automóvel" },
  { descricao: "Motocicleta" },
  { descricao: "Caminhão" },
  { descricao: "Ônibus" },
  { descricao: "Van" },
  { descricao: "Utilitário" }
]

tipos_veiculos.each do |tipo|
  GTipoVeiculo.find_or_create_by!(descricao: tipo[:descricao])
end

puts "#{GTipoVeiculo.count} tipos de veículos criados."

# ============================================
# VEÍCULOS DE EXEMPLO
# ============================================
puts "Criando veículos de exemplo..."

tipo_automovel = GTipoVeiculo.find_by(descricao: "Automóvel")
tipo_moto = GTipoVeiculo.find_by(descricao: "Motocicleta")
tipo_caminhao = GTipoVeiculo.find_by(descricao: "Caminhão")

veiculos = [
  {
    numero_interno: "VEI-001",
    placa: "ABC-1234",
    chassi: "9BWZZZ377VT004251",
    renavam: "00123456789",
    marca: "Volkswagen",
    modelo: "Gol",
    ano: 2020,
    cor: "Branco",
    motor: "1.0",
    g_tipo_veiculo: tipo_automovel,
    tombamento: "TB-001"
  },
  {
    numero_interno: "VEI-002",
    placa: "DEF-5678",
    chassi: "9BWZZZ377VT004252",
    renavam: "00123456790",
    marca: "Fiat",
    modelo: "Uno",
    ano: 2019,
    cor: "Prata",
    motor: "1.0",
    g_tipo_veiculo: tipo_automovel,
    tombamento: "TB-002"
  },
  {
    numero_interno: "VEI-003",
    placa: "GHI-9012",
    chassi: "9BWZZZ377VT004253",
    renavam: "00123456791",
    marca: "Honda",
    modelo: "CG 160",
    ano: 2021,
    cor: "Vermelho",
    motor: "160cc",
    g_tipo_veiculo: tipo_moto,
    tombamento: "TB-003"
  },
  {
    numero_interno: "VEI-004",
    placa: "JKL-3456",
    chassi: "9BWZZZ377VT004254",
    renavam: "00123456792",
    marca: "Toyota",
    modelo: "Corolla",
    ano: 2022,
    cor: "Preto",
    motor: "2.0",
    g_tipo_veiculo: tipo_automovel,
    tombamento: "TB-004"
  },
  {
    numero_interno: "VEI-005",
    placa: "MNO-7890",
    chassi: "9BWZZZ377VT004255",
    renavam: "00123456793",
    marca: "Mercedes-Benz",
    modelo: "Atego 1719",
    ano: 2018,
    cor: "Branco",
    motor: "4.8",
    g_tipo_veiculo: tipo_caminhao,
    tombamento: "TB-005"
  }
]

veiculos.each do |veiculo|
  GVeiculo.find_or_create_by!(numero_interno: veiculo[:numero_interno]) do |v|
    v.placa = veiculo[:placa]
    v.chassi = veiculo[:chassi]
    v.renavam = veiculo[:renavam]
    v.marca = veiculo[:marca]
    v.modelo = veiculo[:modelo]
    v.ano = veiculo[:ano]
    v.cor = veiculo[:cor]
    v.motor = veiculo[:motor]
    v.g_tipo_veiculo = veiculo[:g_tipo_veiculo]
    v.tombamento = veiculo[:tombamento]
  end
end

puts "#{GVeiculo.count} veículos criados."
puts "Seeds executadas com sucesso!"
