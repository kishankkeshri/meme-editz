//
//  CollectionMemeViewController.swift
//  memeAppV1.0
//
//  Created by kishan kumar keshri on 4/04/22.
//

import UIKit

class CollectionMemeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        //Outlets
        @IBOutlet weak var collectionViewOutlet: UICollectionView!
        @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    //let memeEditorViewController : MemeEditorViewController!
    
        //Meme object
        var memes : [Meme]! {
            let object = UIApplication.shared.delegate
            let appDelegate = object as! AppDelegate
            return appDelegate.memes
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            
            //Setting delegates
            collectionViewOutlet.delegate = self
            collectionViewOutlet.dataSource = self
            
            
            //flowlayout
            let space:CGFloat = 3.0
            let dimension = (view.frame.size.width - (2 * space))/3.0
            flowLayout.minimumInteritemSpacing = space
            flowLayout.minimumLineSpacing = space
            flowLayout.itemSize = CGSize(width: dimension, height: dimension)
        }
    
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
            collectionViewOutlet.reloadData()
        }
        
        @IBAction func plusButtonAction(_ sender: Any) {
            let memeEditorViewController = self.storyboard?.instantiateViewController(withIdentifier: "MemeEditorViewController") as! MemeEditorViewController
            self.present(memeEditorViewController, animated: true)
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.memes.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memeCell", for: indexPath) as? MemeCollectionViewCell
            let meme = self.memes[(indexPath as NSIndexPath).row]
            cell!.memeImageView.image = meme.memedImage
            return cell!
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let memedetailController = self.storyboard!.instantiateViewController(withIdentifier: "memeDetailViewController") as! MemeDetailViewController
        memedetailController.meme = self.memes[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(memedetailController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        return CGSize(width: dimension, height: dimension)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

      if collectionView.numberOfItems(inSection: section) == 1 {

           let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

          return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: collectionView.frame.width - flowLayout.itemSize.width)

      }

      return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

  }
}
