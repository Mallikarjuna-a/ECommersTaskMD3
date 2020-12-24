//
//  ViewController.swift
//  ECommersTaskMD3
//
//  Created by Mallikarjuna on 23/12/20.
//  Copyright © 2020 Mallikarjuna. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    
    

    @IBOutlet weak var firstView: UIView!
    
    @IBOutlet weak var newCollectionImageView: UIImageView!
    
    @IBOutlet weak var newCollectionBrandNameLbl: UILabel!
    
    @IBOutlet weak var newCollectionNameLbl: UILabel!
    
    @IBOutlet weak var newCollectioncurrencyCodeLbl: UILabel!
    
    @IBOutlet weak var NCFinalPriceLbl: UILabel!
    
    @IBOutlet weak var NCOrdinaryPriceLbl: UILabel!
    
    
    @IBOutlet weak var NCAddToBagBtn: UIButton!
    
    @IBOutlet weak var NCViewOfTV: UIView!
    
    @IBOutlet weak var NCTableView: UITableView!
    
    @IBOutlet weak var NCShopIDLbl: UILabel!
    
    @IBOutlet weak var relatedProductsHeaderLbl: UILabel!
    
    @IBOutlet weak var RPViewOfCV: UIView!
    
    @IBOutlet weak var RPCollectionView: UICollectionView!
    
    @IBOutlet weak var associatedHeaderLbl: UILabel!
    
    @IBOutlet weak var viewOFAssociatedViewCV: UIView!
    
    @IBOutlet weak var associatedCV: UICollectionView!
    var RPDetails:[RelatedProductsStruct]?
    var AssociatedProductsDetails:[AssociatedProductsStruct]?
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromServer()
        
            RPCollectionView.delegate = self
            RPCollectionView.dataSource = self
        
        
        associatedCV.delegate = self
        associatedCV.dataSource = self
        
        RPCollectionView.register(RPCollectionViewCell.self, forCellWithReuseIdentifier: "RPCVCell")
        associatedCV.register(RPCollectionViewCell.self, forCellWithReuseIdentifier: "RPCVCell")
        // Do any additional setup after loading the view.
    }


    func getDataFromServer() {
        
        var URLReqObj = URLRequest(url: URL(string: "http://mobicraftsv2.com/bloc49/api/v3/product-details?product_id=1812&lang=en&store=KW")!)
        URLReqObj.httpMethod = "GET"
        URLSession.shared.dataTask(with: URLReqObj) { (dataObtained, ConnectionDetails, error) in
            DispatchQueue.main.async {
                if let data = dataObtained {
                    do {
                        let convertedData = try JSONDecoder().decode(DataFrmSvrStruct.self, from: data)
                        
                        if let success = convertedData.success,
                            let status = convertedData.status,
                            let message = convertedData.message,
                            let data = convertedData.data{
                            
                            print("\(success),\(status),\(message)")
                            if let id = data.id,
                                let name = data.name,
                                let shortDescription = data.short_description,
                                let description = data.description,
                                let specification = data.specification,
                                let shippingFreeReturns = data.shipping_free_returns,
                                let SKU = data.SKU,
                                let isUsed = data.is_used,
                                let regularPrice = data.regular_price,
                                let finalPrice = data.final_price,
                                let currencyCode = data.currency_code,
                                let remainingQuantity = data.remaining_quantity,
                                let isFeatured = data.is_featured,
                                let isGift = data.is_gift,
                                let newFromDate = data.new_from_date,
                                let newToDate = data.new_to_date,
                                let brandName = data.brand_name,
                                let image = data.image,
                                let video = data.video,
                                let isSaleable = data.is_saleable,
                                let productType = data.product_type,
                                let itemInCart = data.item_in_cart,
                                let itemInWishlist = data.item_in_wishlist,
                                let averageRating = data.average_rating,
                                let sizeGuide = data.size_guide,
                                let shopId = data.shop_id,
                                let shop = data.shop,
                                let shopDescription = data.shop_description,
                                let shopImage = data.shop_image,
                                let deliveryTime = data.delivery_time,
                                let deliveryTimeText = data.delivery_time_text,
                                let images = data.images,
                                let configurableOption = data.configurable_option,
                                let relatedProducts = data.related_products,
                                let associatedProducts = data.associated_products {
                                print("New Collections")
                                print("image::\(image),BrandName::\(brandName),name::\(name),CurrencyCode::\(currencyCode),FinalPrice::\(finalPrice),RegularPrice::\(regularPrice),Description::\(description),shop::\(shop),BrandName::\(id),BrandName::\(id)")
                                
                                
                                self.newCollectionBrandNameLbl.text = brandName
                                self.newCollectionNameLbl.text = name
                                self.newCollectioncurrencyCodeLbl.text = currencyCode
                                self.NCFinalPriceLbl.text = finalPrice
                                self.NCOrdinaryPriceLbl.text = regularPrice
                                self.NCShopIDLbl.text = shop
                                let imageURL = URL(string: image)
                                URLSession.shared.dataTask(with: imageURL!) { (data, connectionDetails, error) in
                                    DispatchQueue.main.async {
                                        if let data = data{
                                            self.newCollectionImageView.image = UIImage(data: data)
                                        }
                                    }
                                    
                                }.resume()
                                
                                print("**************")
                                print("Related  Products")
                                self.RPDetails = relatedProducts
//                                self.RPCollectionView.reloadData()
                                for relatedItem in relatedProducts {
                                    
                                    if let id = relatedItem.id,
                                        let image = relatedItem.image,
                                        let brandName = relatedItem.brand_name,
                                        let currencyCode = relatedItem.currency_code,
                                        let finalPrice = relatedItem.final_price,
                                        let regularPrice = relatedItem.regular_price{
                                        
                                        print("image::\(image),brandName::\(brandName),currencyCode::\(currencyCode),FinalPrice::\(finalPrice),regularPrice::\(regularPrice)")
                                        
                                    }
                                }
                                
                                print("************")
                                print("AssociatedProducts")
                                self.AssociatedProductsDetails = associatedProducts
//                                self.associatedCV.reloadData()
                                for associatedItem in associatedProducts {
                                    
                                    if let image = associatedItem.image,
                                        let brandName = associatedItem.brand_name,
                                        let currencyCode = associatedItem.currency_code,
                                        let finalPrice = associatedItem.final_price,
                                        let regularPrice = associatedItem.regular_price {
                                        print("image::\(image),brandName::\(brandName),currencyCode::\(currencyCode),finalPrice::\(finalPrice),regularPrice::\(regularPrice)")
                                    }
                                }
                                
                                
                            }
                            
                        }
                        
                    } catch {
                        print("Unable to convert data")
                        print(error.localizedDescription)
                    }
                }
            }
        }.resume()
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var noOfItems:Int!
        if collectionView == RPCollectionView {
            
            noOfItems = RPDetails?.count
            print(noOfItems)
        } else if collectionView == associatedCV {
                    
            noOfItems = AssociatedProductsDetails?.count
            print(noOfItems)
        }
    return noOfItems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = RPCollectionView.dequeueReusableCell(withReuseIdentifier: "RPCVCell", for: indexPath) as! RPCollectionViewCell
        if collectionView == RPCollectionView {
            
                        if let RPData = RPDetails {
                            if let brandName = RPData[indexPath.item].brand_name{
                            item.BrandNameLbl.text = brandName
                        }
            
                    }
                    } else if collectionView == associatedCV {
            
                            if let APData = AssociatedProductsDetails {
                                    if let brandName = APData[indexPath.item].brand_name{
                                    item.BrandNameLbl.text = brandName
                                }
            }
                        
            
        }
    
    return item
    }


}
