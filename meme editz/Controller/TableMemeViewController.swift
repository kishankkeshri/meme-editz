//
//  TableMemeViewController.swift
//  memeAppV1.0
//
//  Created by kishan kumar keshri on 28/03/22.
//

import UIKit

class TableMemeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    
    var memes : [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableViewOutlet.reloadData()
    }
    
    @IBAction func plusButtonAction(_ sender: Any) {
        let memeEditorViewController = self.storyboard?.instantiateViewController(withIdentifier: "MemeEditorViewController") as! MemeEditorViewController
        self.present(memeEditorViewController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memeCell")!
        let meme = self.memes[(indexPath as NSIndexPath).row]
        let memeText = "\(meme.topText)...\(meme.bottomText)"
        cell.textLabel?.text = memeText
        cell.imageView?.image = meme.memedImage
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let memedetailController = self.storyboard!.instantiateViewController(withIdentifier: "memeDetailViewController") as! MemeDetailViewController
        memedetailController.meme = self.memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(memedetailController, animated: true)
    }


}
