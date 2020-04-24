//
//  MarvelCharacterListViewController.swift
//  PruebaTecnica
//
//  Created by juan.p.arias.botella on 20/04/2020.
//  Copyright © 2020 Juan Arias. All rights reserved.
//

import UIKit
import Foundation
import CommonCrypto
import MarvelClient

protocol MarvelCharacterListDisplayLogic {
    
    func successFetchCharacters(viewModel: [CharacterModel])
    func errorFetchCharacters()
}

class MarvelCharacterListViewController: UIViewController, MarvelCharacterListDisplayLogic, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var charactersTableView: UITableView!
    var interactor: MarvelCharacterListBussinessLogic?
    var router: (NSObjectProtocol & MarvelCharacterListRoutingLogic & MarvelCharacterListDataPassing)?
    
    var characters: [CharacterModel] = []
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        
        let viewController = self
        let interactor = MarvelCharacterListInteractor()
        let presenter = MarvelCharacterListPresenter()
        let router = MarvelCharacterListRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        charactersTableView.register(UINib(nibName: "CharacterCell", bundle: nil), forCellReuseIdentifier: "CharacterCell")
        
        charactersTableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        interactor?.fetchCharacters(limit: Constants.limit, offset: Constants.offset, hash: Utilities.encryptHashMD5(), apikey: Constants.publicKey, ts: Constants.ts)
    }
    
    // MARK: - MarvelCharacyerListDisplayLogic
    
    func successFetchCharacters(viewModel: [CharacterModel]) {
        
        characters = viewModel
        charactersTableView.reloadData()
    }
    
    func errorFetchCharacters() {
        
        let alert = UIAlertController(title: "Service Error", message: "An error ocurred at the service call", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        
        cell.nameLbl.text = characters[indexPath.row].name
        return cell
    }
    
    // MARK: - RouteToCharacterDetail
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        interactor?.setCharacter(characterDetail: characters[indexPath.row])
        performSegue(withIdentifier: "CharacterListToCharacterDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let scene = segue.identifier {
            
            if scene == "CharacterListToCharacterDetail" {
                router?.routeToCharacterDetail(segue: segue)
            }
        }
    }
}
