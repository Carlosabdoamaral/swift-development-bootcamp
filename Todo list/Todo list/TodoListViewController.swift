//
//  ViewController.swift
//  Todo list
//
//  Created by Carlos Amaral on 09/05/22.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = ["Find Mike", "Buy Eggs", "Destroy Demogorgon"]
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  Dizendo que o array vai ser o que esta no storage do usuário
        if let items = UserDefaults.standard.array(forKey: "itemArray") as? [String] {
            itemArray = items
        }
        
        
    }
    
    // MARK: STEP 1
    // Retornando o número de itens da lista
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    // MARK: STEP 2
    // Basicamente um forEach
    // Explicação
        // Criamos uma celula dizendo que o "reusableIdentifier" dela é o "ToDoItemCell" atribuido lá no "main.Storyboard"
        // Setamos o "indexPath" (controlador do for) (que já vem na função pronto)
        // Atribuimos o texto do atual item do array sendo equivalente ao texto da celula
        // Retornamos a celula
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    
    // MARK: STEP 3
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //  Valida se já existe um checkbox no item
        //  Se já existir ele remove
        //  Se não ele adiciona
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        //  Ao inves de ficar selecionado, ele apenas "pisca" (Seleciona e deseleciona)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // MARK: ADD ITEM
    @IBAction func addNewItem(_ sender: Any) {
        
        //  Cria o input e inicializa o mesmo
        var textField = UITextField()
        
        //  Cria o alerta
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        
        
        //  Cria a ação
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //  O que acontece quando o usuário clicar para adicionar no alert
            //  print(textField.text)
            
            //  Valida se o input tem texto
            if textField.hasText {
                //  Adiciona no array
                self.itemArray.append(textField.text!)
                
                //  Salvar o item no UserDefaults
                self.defaults.set(self.itemArray, forKey: "TodoListArray")
                
                //  Recarrega os items para atualizar a lista
                self.tableView.reloadData()
            }
        }
        
        
        
        //  Adiciona o input no alert
        alert.addTextField { (alertTextField) in
            //  Em função de escopos diferente, a gente referencia a variavel já inicializada
            textField = alertTextField
            
            //  Adiciona um placeholder
            alertTextField.placeholder = "Type something..."
        }
        
        
        
        //  Adiciona a action ao alert
        alert.addAction(action)
        
        
        
        //  Apresenta/Mostra o alerta
        present(alert, animated: true, completion: nil)
    }

}

