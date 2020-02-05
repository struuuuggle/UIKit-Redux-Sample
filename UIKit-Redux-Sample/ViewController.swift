//
//  ViewController.swift
//  SignUp-RxSwift
//
//  Created by Mikiya Abe on 2020/02/05.
//  Copyright © 2020 struuuuggle. All rights reserved.
//

import UIKit
import ReSwift
import RxSwift
import RxCocoa

let screen = UIScreen.main.bounds

final class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    private var searchResult = [String]()
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.rx.text.asDriver()
            .drive(onNext: { [weak self] value in
                guard let _ = self, let value = value else { return }
                appStore.dispatch(SearchAction.requestAsyncCreator(by: value))
            })
            .disposed(by: disposeBag)                
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        appStore.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        appStore.unsubscribe(self)
    }
}

extension ViewController: StoreSubscriber {
    
    func newState(state: AppState) {
        self.searchResult = state.searchState.users
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return !self.searchResult.isEmpty ? self.searchResult.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if self.searchResult.count > 0 {
            cell.textLabel?.text = self.searchResult[indexPath.row]
        }
        return cell
    }
}
