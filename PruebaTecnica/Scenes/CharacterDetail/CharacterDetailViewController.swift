//
//  CharacterDetailViewController.swift
//  PruebaTecnica
//
//  Created by juan.p.arias.botella on 20/04/2020.
//  Copyright © 2020 Juan Arias. All rights reserved.
//

import UIKit

protocol CharacterDetailDisplayLogic {}

class CharacterDetailViewController: UIViewController, CharacterDetailDisplayLogic, UITableViewDataSource {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var ivThumbnail: UIImageView!
    @IBOutlet weak var tvDescription: UITextView!
    @IBOutlet weak var comicsTableView: UITableView!
    
    var interactor: CharacterDetailBussinessLogic?
    var router: (NSObjectProtocol & CharacterDetailRoutingLogic & CharacterDetailDataPassing)?
    
    var character: CharacterModel?
    
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
        let interactor = CharacterDetailInteractor()
        let presenter = CharacterDetailPresenter()
        let router = CharacterDetailRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        comicsTableView.register(UINib(nibName: "CharacterCell", bundle: nil), forCellReuseIdentifier: "CharacterCell")
        comicsTableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        character = interactor?.getCharacter()
        setupView()
    }
    
    func setupView() {
        
        lblName.text = character?.name
        ivThumbnail.load(url: URL(string: character?.thumbnail ?? "")!)
        tvDescription.text = character?.description
        tvDescription.sizeToFit()
        tvDescription.isScrollEnabled = false
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return character?.comics.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        
        cell.nameLbl.text = character?.comics[indexPath.row]
        
        return cell
    }
}

extension UIImageView {
    
    func load(url: URL) {
        
        if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                        
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
