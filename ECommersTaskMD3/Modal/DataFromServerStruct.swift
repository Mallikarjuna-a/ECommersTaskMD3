//
//  DataFromServerStruct.swift
//  ECommersTaskMD3
//
//  Created by Mallikarjuna on 23/12/20.
//  Copyright © 2020 Mallikarjuna. All rights reserved.
//

import Foundation

struct DataFrmSvrStruct: Codable {
    var success : Bool?
    var status : UInt?
    var message : String?
    var data : dataStruct?
    
}
struct dataStruct: Codable {
    var id : UInt?
    var name : String?
    var short_description : String?
    var description : String?
    var specification : String?
    var shipping_free_returns : String?
    var SKU : String?
    var is_used : UInt?
    var regular_price : String?
    var final_price : String?
    var currency_code : String?
    var remaining_quantity : UInt?
    var is_featured : UInt?
    var is_gift : UInt?
    var new_from_date : String?
    var new_to_date : String?
    var brand_name : String?
    var image : String?
    var images : [String]?
    var video : String?
    var configurable_option : [ConfigurableOptionStruct]?
    var related_products : [RelatedProductsStruct]?
    
    var is_saleable : UInt?
    var product_type : String?
    var associated_products : [AssociatedProductsStruct]?
    var item_in_cart : UInt?
    var item_in_wishlist : UInt?
    var average_rating : String?
    var size_guide : String?
    var shop_id : UInt?
    var shop : String?
    var shop_description : String?
    var shop_image : String?
    var delivery_time : String?
    var delivery_time_text : String?
    
}

struct ConfigurableOptionStruct: Codable {
    
    var type : String?
    var attribute_id : String?
    var attribute_code : String?
    var attributes : [AttributesStruct]?
}
struct AttributesStruct: Codable {
    var option_id : String?
    var option_product_id : String?
    var value : String?
}
struct RelatedProductsStruct: Codable {
    var id : UInt?
    var name : String?
    var short_description : String?
    var description : String?
    var specification : String?
    var shipping_free_returns : String?
    var SKU : String?
    var regular_price : String?
    var final_price : String?
    var currency_code : String?
    var remaining_quantity : UInt?
    var is_featured : UInt?
    var new_from_date : String?
    var new_to_date : String?
    var brand_name : String?
    var image : String?
    var is_saleable : UInt?
    var shop_id : UInt?
    var delivery_time : String?
    var delivery_time_text : String?
    
}

struct AssociatedProductsStruct: Codable {
    var id : UInt?
    var name : String?
    var short_description : String?
    var description : String?
    var SKU : String?
    var regular_price : String?
    var final_price : String?
    var currency_code : String?
    var remaining_quantity : UInt?
    var is_featured : UInt?
    var new_from_date : String?
    var new_to_date : String?
    var brand_name : String?
    var boutique_name : String?
    var image : String?
    var delivery_time : String?
    var delivery_time_text : String?
}
