//  Vars.swift
//  MarketTracker  ∙  Created 2018-11-17 by Garth Snyder a.k.a. gladiusKatana ⚔️
import UIKit

var globalKeyWindow = UIApplication.shared.keyWindow;                   //var apDel = UIApplication.shared.delegate as? AppDelegate
var vcLoaded = "view controller id"                                     //var previousVC = UICollectionViewController() // only used for navigation
var navController: UINavigationController? = UINavigationController()
var statusBar = UIView()



var fillerButton = UIBarButtonItem();           var reloadTableButton = UIBarButtonItem()
var headerTitleLabel = UILabel();               var tableHeaderString = "Tap button to reload current prices (1-2 min. latency from most exchanges) ⟶"
var viewFrameHeight = CGFloat(0);               var viewFrameWidth = CGFloat(0)
var orientationAdjustment = 0.0;                var additionalVerticalOffset = 0.0



var tradePanelLayout = CollectionViewLayout()
var tradePanelVC = TradePanelVC(collectionViewLayout: tradePanelLayout)
///var tradePanelVC = CollectionViewController(tableActive: true, timerSymbol: nil, collectionViewLayout: collectionViewLayout)
var candleVC = CandleVC()
var cellWidth = CGFloat();                      var cellHeight = CGFloat()
var numSections = 9;                            var numRows = 400


var binanceCandles: [[AnyObject]]?;             var binanceCandleSub = [[AnyObject]]()  //; var binanceChunks: [BinanceChunk]?

var krakenOHLCChunks: [KrakenOHLCChunk]?;       var krakenPair = "XXBTZCAD"

var shakepayPriceUpdates: [ShakepayPriceUpdate]?
//var latestShakepayPrices: [Any]?


var latestKrakenBTCBuyPrice = 0.0;              var latestBinanceETHBTCPrice = 0.0
var diffAbs = 0.0;                              var diffPer = 0.0
var diffAbsRounded = 0;                         var diffPerRounded = 0.0

var exchangesReloaded = [0, //Kraken
    0, //[Shakepay]
    0] //Binance


var (tm, weekday, dy) = ("", "", "")

var firstLoaded = false;            var dataSourceDidUpdate = false
var scrollable = true;              var menuBarOn = false
var justPinchedFromCandleView = false
var showCandleViewAutomatically = true
var candleViewShowing = false


var backingColour = UIColor.rgb(150, green: 180, blue: 220, alpha: 1)
var lightBlue = UIColor.rgb(150, green: 180, blue: 220, alpha: 0.3)
var navyBlue = UIColor.rgb(0, green: 36, blue: 50, alpha: 0.3)
var platinum = UIColor.rgb(214, green: 214, blue: 235, alpha: 0.7)


