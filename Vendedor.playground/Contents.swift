import UIKit

//- Um vendedor de loja e possui nome, idade e cpf, saldo em conta
//    - vende em sua loja ternos, vestidos e bonés
//    - definir um método vender (quantidadeDePecas: Int, tipoDePeca: String).
//- Cada terno custa 400 reais,
//   - caso o cliente compre 3 ou mais ternos, ele recebe 50 de desconto para cada terno.
//- Cada vestido custa 900 reais,
//   - caso o cliente compre 5 vestidos ele ganha um véu de noiva (que custa 250 reais) de brinde.
//- Cada boné custa 50 reais, e para cada 2 bonés vendidos, o terceiro é grátis, logo não haverá lucro.
//- Encapsule todos os métodos necessários.

class Vendedor {
    private var nome: String
    private var idade: Int
    private var cpf: String
    private var saldoEmConta: Float
    
    init(nome: String, idade: Int, cpf: String, saldoEmConta: Float) {
        self.nome = nome
        self.idade = idade
        self.cpf = cpf
        self.saldoEmConta = saldoEmConta
    }
    public func getNome() -> String  {
        return(self.nome)
    }
    
    public func setNome(_ nome: String) {
        self.nome = nome
    }
    
    public func getIdade() -> Int  {
        return(self.idade)
    }
    
    public func setIdade(_ idade: Int) {
        self.idade = idade
    }
    
    public func getCpf() -> String  {
        return(self.cpf)
    }
    
    public func setCpf(_ cpf: String) {
        self.cpf = cpf
    }
    
    public func getSaldoEmConta() -> Float  {
        return(self.saldoEmConta)
    }
    
    private func setSaldoEmConta(_ valor: Float) {
        self.saldoEmConta += valor
    }
    
    public func vender(quantidadeDePecas: Int, tipoDePeca: String) {
        var valorDaVenda: Float = 0;
        if(tipoDePeca == "terno") {
            if(quantidadeDePecas < 3) {
                valorDaVenda = Float(quantidadeDePecas) * 400
                print("\(valorDaVenda)")
            }
            else {
                valorDaVenda = Float(quantidadeDePecas * 400) - Float(50 * quantidadeDePecas)
                print("\(valorDaVenda)")
            }
        }
        else if(tipoDePeca == "vestido") {
            if(quantidadeDePecas < 5) {
                valorDaVenda = Float(quantidadeDePecas) * 900
                print("\(valorDaVenda)")
            }
            else {
                valorDaVenda = Float(quantidadeDePecas * 900) - 250
                print("\(valorDaVenda)")
            }
        }
        else if(tipoDePeca == "bone") {
            valorDaVenda = Float(quantidadeDePecas * 50);
            let quantidadeDeBrindes = quantidadeDePecas / 2;
            
            if(quantidadeDeBrindes > 0) {
                valorDaVenda -= Float(50 * quantidadeDeBrindes)
                print("\(valorDaVenda)")
            }
        }

        setSaldoEmConta(valorDaVenda)
    }
}

let joao = Vendedor(nome: "Joao", idade: 36, cpf: "12312312312", saldoEmConta: 0)
joao.vender(quantidadeDePecas: 3, tipoDePeca: "terno")
print(joao.getSaldoEmConta())
joao.vender(quantidadeDePecas: 1, tipoDePeca: "terno")
print(joao.getSaldoEmConta())


print("\n")

let marcelo = Vendedor(nome: "Marcelo", idade: 26, cpf: "31231231212", saldoEmConta: 0)
marcelo.vender(quantidadeDePecas: 5, tipoDePeca: "vestido")
print(marcelo.getSaldoEmConta())
marcelo.vender(quantidadeDePecas: 1, tipoDePeca: "vestido")
print(marcelo.getSaldoEmConta())

print("\n")

let marcos = Vendedor(nome: "Marcos", idade: 20, cpf: "23123123121", saldoEmConta: 0)
marcos.vender(quantidadeDePecas: 3, tipoDePeca: "bone")
print(marcos.getSaldoEmConta())

print("\n")

let jorge = Vendedor(nome: "Jorge", idade: 25, cpf: "23123123121", saldoEmConta: 0)
jorge.vender(quantidadeDePecas: 2, tipoDePeca: "bone")
print(jorge.getSaldoEmConta())

print("\n")

let ulisses = Vendedor(nome: "Ulisses", idade: 25, cpf: "23123123121", saldoEmConta: 0)
ulisses.vender(quantidadeDePecas: 6, tipoDePeca: "bone")
print(ulisses.getSaldoEmConta())
