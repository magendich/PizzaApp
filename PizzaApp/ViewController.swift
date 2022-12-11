//
//  ViewController.swift
//  PizzaApp
//
//  Created by Магомед Аллахвердиев on 16.11.2022.
//


import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var SearchBarMenuScreen: UISearchBar!
    
    var pizzaModel = [Pizza]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alamofireJSONRequest(urlAdress: urlString) { data, error in
            self.TableView.reloadData() }
        
        TableView.delegate = self
        TableView.dataSource = self
        SearchBarMenuScreen.delegate = self

        
    }
    
    
    // MARK: Метод запроса в сеть
    
    let urlString = "http://sportride.kz/pizzatest.php"
    func alamofireJSONRequest(urlAdress: String, completed: @escaping (Data?, Error?) -> Void) {
        Alamofire.request(urlString, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).response { response in
            
            let error = response.error
            if error != nil {
                print("JSON = nil")
                return
            }
            guard let data = response.data else { return }
            do {
                self.pizzaModel = try JSONDecoder().decode([Pizza].self, from: data)
                DispatchQueue.main.async {
                    completed(data, nil)
                    print("ОБРАБОТАЛСЯ ЗАПРОС В СЕТЬ")
                }
                pizzaDataBase = self.pizzaModel
            print("ДАННЫЕ ЗАПИСАЛИСЬ В DataBase")
                print(self.pizzaModel)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
    // MARK: Методы для работы с Tableview
    
    var idCell = "ModelCell"
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizzaModel.count
        print("ПЕРЕДАЁМ КОЛ-ВО cells в tablewview")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as! ModelTableViewCell
        
        cell.PizzaImage.downloaded(from: pizzaModel[indexPath.row].img)
        cell.PizzaTitle.text = pizzaModel[indexPath.row].title
        cell.PizzaPrice.text = "от " + pizzaModel[indexPath.row].price + " ₽"
        cell.PizzaIngredients.text = pizzaModel[indexPath.row].ingridients.joined(separator: ", ")
        print("СОЗДАЛИСЬ ЯЧЕЙКИ В TABLEWIEW")
        
        return cell
    }
}

// MARK: Расширение и метод для работы со строкой поиска

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            alamofireJSONRequest(urlAdress: urlString) { data, error in
                self.TableView.reloadData() }
        } else {
            pizzaModel = pizzaModel.filter { pizza in
                return pizza.title.lowercased().contains(searchText.lowercased())
            }
            self.TableView.reloadData()
        }
    }
    
    
    // MARK: Методы для перехода с экрана TableView на экран с показом пиццы
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToPizzaSelectViewController", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vcGoToPizzaSelect = segue.destination as? PizzaSelectViewController {
            vcGoToPizzaSelect.pizzaModelSelectVC = pizzaModel[TableView.indexPathForSelectedRow!.row]
        }
    }
}
