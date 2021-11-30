class Cliente{
  String nome;
  var compras;
  String telefone;
  int prioridade;
  double dinheiroGasto;

  Cliente(String nome, String telefone){
    this.nome= nome;
    this.telefone= telefone;
    this.compras= <Venda>[];
  }

  void setNome(String nome){
    this.nome= nome;
  }

  String getNome(){
    return this.nome;
  }

  void setTelefone(String telefone){
    this.telefone= telefone;
  }

  void aumentaPrioridade(int valor){
    this.prioridade= this.prioridade+valor;
  }

  int getPrioridade(){
    return this.prioridade;
  }

  Venda registraCompra(){ //Implementar
    return null;
  }

  List<Venda> getCompras(){
    return this.compras;
  }

}

class Juice{
  String nome;
  int teorNicMg;
  int volumeMl;
  int quantidade;
  double preco;

  Juice(
    String nome,  
    int teorNicMg, 
    int volumeMl,
    int quantidade,
    double preco){
      this.nome= nome;
      this.teorNicMg= teorNicMg;
      this.volumeMl= volumeMl;
      this.quantidade= quantidade;
      this.preco= preco;
  }

  String getNome(){
    return this.nome;
  } 

  int getTeorNicMg(){
   return this.teorNicMg;
  }

  int getVolumeMl(){
   return this.volumeMl;
  }

  int getQuantidade(){
   return this.quantidade;
  }

  double getPreco(){
    return this.preco;
  }

}

class Remessa{
  DateTime dataInicio;
  DateTime dataFim;
  var vendas;
  var estoqueJuice;

  Remessa(DateTime dataInicio){ //Deve estar errado
    this.dataInicio= dataInicio;
    this.vendas= <Venda>[];
    this.estoqueJuice= <Juice>[];
  }

DateTime getDataInicio(){
  return this.dataInicio;
}

DateTime getDatafim(){
  return this.getDatafim();
}

void setDataFim(DateTime dataFim){
  this.dataFim= dataFim;
}

List<Venda> getVendas(){
  return this.vendas;
}

void fechaRemessa(DateTime dataFim){
  this.dataFim= dataFim;
}

void setEstoque(List<Juice> estoqueJuice){
  this.estoqueJuice= estoqueJuice;
}

List<Juice> getEstoque(){
  return this.estoqueJuice;
}

}


class Socio{
  String nome;
  String infoBancaria;
  String cpf;
  double valorVendido;

  Socio(String nome, String cpf){
    this.nome= nome;
    this.cpf= cpf;
    this.valorVendido= 0;
  }

  void setInfoBancaria(String infoBancaria){
    this.infoBancaria= infoBancaria;
  }

  void somaValorVendido(double valor){
    this.valorVendido= this.valorVendido + valor;
  }

  String getCpf(){
    return this.cpf;
  }

  String getNome(){
    return this.nome;
  }

  String getinfoBancaria(){
    return this.infoBancaria;
  }

  double getValorVendido(){
    return this.valorVendido;
  }

}

class Venda{
    Cliente cliente;
    Socio vendedor;
    DateTime data;
    double valor;
    var juicesVendidos;

    Venda(
      Cliente cliente,
      Socio vendedor,
      DateTime data,
      double valor,
      ){
        this.cliente= cliente;
        this.vendedor= vendedor;
        this.data= data;
        this.valor= valor;
        this.juicesVendidos= <Juice>[];
    }

  DateTime getData(){
    return this.data;
  }

  List<Juice> getJuicesVendidos(){
    return this.juicesVendidos;
  }

  double getValor(){
    return this.valor;
  }

  Cliente getCliente(){
    return this.cliente;
  }

  Socio getVendedor(){
    return this.vendedor;
  }

  void fechaVenda(){
    //implement
  }

}