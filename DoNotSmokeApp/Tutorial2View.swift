//
//  Tutorial2View.swift
//
//  Code generated using QuartzCode 1.55.0 on 2/22/17.
//  www.quartzcodeapp.com
//

import UIKit

@IBDesignable
class Tutorial2View: UIView, CAAnimationDelegate {
	
	var layers : Dictionary<String, AnyObject> = [:]
	var completionBlocks : Dictionary<CAAnimation, (Bool) -> Void> = [:]
	var updateLayerValueForCompletedAnimation : Bool = false
	
	
	
	//MARK: - Life Cycle
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupProperties()
		setupLayers()
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		super.init(coder: aDecoder)
		setupProperties()
		setupLayers()
	}
	
	override var frame: CGRect{
		didSet{
			setupLayerFrames()
		}
	}
	
	override var bounds: CGRect{
		didSet{
			setupLayerFrames()
		}
	}
	
	func setupProperties(){
		
	}
	
	func setupLayers(){
		let PigBank = CALayer()
		self.layer.addSublayer(PigBank)
		layers["PigBank"] = PigBank
		let pig = CALayer()
		PigBank.addSublayer(pig)
		layers["pig"] = pig
		let hole = CALayer()
		PigBank.addSublayer(hole)
		layers["hole"] = hole
		
		let coin = CALayer()
		self.layer.addSublayer(coin)
		layers["coin"] = coin
		
		let cabelo = CALayer()
		self.layer.addSublayer(cabelo)
		layers["cabelo"] = cabelo
		
		let time = CALayer()
		self.layer.addSublayer(time)
		layers["time"] = time
		
		let cinema = CALayer()
		self.layer.addSublayer(cinema)
		layers["cinema"] = cinema
		
		resetLayerProperties(forLayerIdentifiers: nil)
		setupLayerFrames()
	}
	
	func resetLayerProperties(forLayerIdentifiers layerIds: [String]!){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if layerIds == nil || layerIds.contains("pig"){
			let pig = layers["pig"] as! CALayer
			pig.contents = UIImage(named:"pig")?.cgImage
		}
		if layerIds == nil || layerIds.contains("hole"){
			let hole = layers["hole"] as! CALayer
			hole.contents = UIImage(named:"hole")?.cgImage
		}
		if layerIds == nil || layerIds.contains("coin"){
			let coin = layers["coin"] as! CALayer
			coin.contents = UIImage(named:"coin")?.cgImage
		}
		if layerIds == nil || layerIds.contains("cabelo"){
			let cabelo = layers["cabelo"] as! CALayer
			cabelo.contents = UIImage(named:"cabelo")?.cgImage
		}
		if layerIds == nil || layerIds.contains("time"){
			let time = layers["time"] as! CALayer
			time.contents = UIImage(named:"time")?.cgImage
		}
		if layerIds == nil || layerIds.contains("cinema"){
			let cinema = layers["cinema"] as! CALayer
			cinema.contents = UIImage(named:"cinema")?.cgImage
		}
		
		CATransaction.commit()
	}
	
	func setupLayerFrames(){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if let PigBank : CALayer = layers["PigBank"] as? CALayer{
			PigBank.frame = CGRect(x: 0.28333 * PigBank.superlayer!.bounds.width, y: 0.37762 * PigBank.superlayer!.bounds.height, width: 0.43333 * PigBank.superlayer!.bounds.width, height: 0.33238 * PigBank.superlayer!.bounds.height)
		}
		
		if let pig : CALayer = layers["pig"] as? CALayer{
			pig.frame = CGRect(x: 0, y: 0, width:  pig.superlayer!.bounds.width, height:  pig.superlayer!.bounds.height)
		}
		
		if let hole : CALayer = layers["hole"] as? CALayer{
			hole.frame = CGRect(x: 0.36538 * hole.superlayer!.bounds.width, y: 0.09741 * hole.superlayer!.bounds.height, width: 0.26923 * hole.superlayer!.bounds.width, height: 0.1053 * hole.superlayer!.bounds.height)
		}
		
		if let coin : CALayer = layers["coin"] as? CALayer{
			coin.frame = CGRect(x: 0.42 * coin.superlayer!.bounds.width, y: -0.22333 * coin.superlayer!.bounds.height, width: 0.16 * coin.superlayer!.bounds.width, height: 0.16 * coin.superlayer!.bounds.height)
		}
		
		if let cabelo : CALayer = layers["cabelo"] as? CALayer{
			cabelo.frame = CGRect(x: 0.06667 * cabelo.superlayer!.bounds.width, y: 1.06279 * cabelo.superlayer!.bounds.height, width: 0.26667 * cabelo.superlayer!.bounds.width, height: 0.28108 * cabelo.superlayer!.bounds.height)
		}
		
		if let time : CALayer = layers["time"] as? CALayer{
			time.frame = CGRect(x: 0.345 * time.superlayer!.bounds.width, y: 1.0782 * time.superlayer!.bounds.height, width: 0.3 * time.superlayer!.bounds.width, height: 0.25026 * time.superlayer!.bounds.height)
		}
		
		if let cinema : CALayer = layers["cinema"] as? CALayer{
			cinema.frame = CGRect(x: 0.65 * cinema.superlayer!.bounds.width, y: 1.06354 * cinema.superlayer!.bounds.height, width: 0.3 * cinema.superlayer!.bounds.width, height: 0.27958 * cinema.superlayer!.bounds.height)
		}
		
		CATransaction.commit()
	}
	
	//MARK: - Animation Setup
	
	func addStickersAnimation(completionBlock: ((_ finished: Bool) -> Void)? = nil){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = 2.431
			completionAnim.delegate = self
			completionAnim.setValue("Stickers", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.add(completionAnim, forKey:"Stickers")
			if let anim = layer.animation(forKey: "Stickers"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		let fillMode : String = kCAFillModeForwards
		
		////PigBank animation
		let PigBankOpacityAnim      = CAKeyframeAnimation(keyPath:"opacity")
		PigBankOpacityAnim.values   = [0, 1]
		PigBankOpacityAnim.keyTimes = [0, 1]
		PigBankOpacityAnim.duration = 1.03
		
		let PigBank = layers["PigBank"] as! CALayer
		
		let PigBankTransformAnim       = CAKeyframeAnimation(keyPath:"transform")
		PigBankTransformAnim.values    = [NSValue(caTransform3D: CATransform3DIdentity), 
			 NSValue(caTransform3D: CATransform3DMakeScale(0, 0, 0))]
		PigBankTransformAnim.keyTimes  = [0, 1]
		PigBankTransformAnim.duration  = 0.852
		PigBankTransformAnim.beginTime = 1.58
		
		let PigBankStickersAnim : CAAnimationGroup = QCMethod.group(animations: [PigBankOpacityAnim, PigBankTransformAnim], fillMode:fillMode)
		PigBank.add(PigBankStickersAnim, forKey:"PigBankStickersAnim")
		
		let coin = layers["coin"] as! CALayer
		
		////Coin animation
		let coinPositionAnim       = CAKeyframeAnimation(keyPath:"position")
		coinPositionAnim.values    = [NSValue(cgPoint: CGPoint(x: 0.5 * coin.superlayer!.bounds.width, y: -0.14333 * coin.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.5 * coin.superlayer!.bounds.width, y: 0.31667 * coin.superlayer!.bounds.height))]
		coinPositionAnim.keyTimes  = [0, 1]
		coinPositionAnim.duration  = 0.228
		coinPositionAnim.beginTime = 1.06
		
		let coinTransformAnim       = CAKeyframeAnimation(keyPath:"transform")
		coinTransformAnim.values    = [NSValue(caTransform3D: CATransform3DIdentity), 
			 NSValue(caTransform3D: CATransform3DMakeScale(0, 0, 0))]
		coinTransformAnim.keyTimes  = [0, 1]
		coinTransformAnim.duration  = 0.852
		coinTransformAnim.beginTime = 1.58
		
		let coinStickersAnim : CAAnimationGroup = QCMethod.group(animations: [coinPositionAnim, coinTransformAnim], fillMode:fillMode)
		coin.add(coinStickersAnim, forKey:"coinStickersAnim")
		
		let cabelo = layers["cabelo"] as! CALayer
		
		////Cabelo animation
		let cabeloPositionAnim       = CAKeyframeAnimation(keyPath:"position")
		cabeloPositionAnim.values    = [NSValue(cgPoint: CGPoint(x: 0.2 * cabelo.superlayer!.bounds.width, y: 1.20333 * cabelo.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.2 * cabelo.superlayer!.bounds.width, y: 0.5 * cabelo.superlayer!.bounds.height))]
		cabeloPositionAnim.keyTimes  = [0, 1]
		cabeloPositionAnim.duration  = 0.285
		cabeloPositionAnim.beginTime = 1.67
		
		let cabeloStickersAnim : CAAnimationGroup = QCMethod.group(animations: [cabeloPositionAnim], fillMode:fillMode)
		cabelo.add(cabeloStickersAnim, forKey:"cabeloStickersAnim")
		
		let time = layers["time"] as! CALayer
		
		////Time animation
		let timePositionAnim       = CAKeyframeAnimation(keyPath:"position")
		timePositionAnim.values    = [NSValue(cgPoint: CGPoint(x: 0.495 * time.superlayer!.bounds.width, y: 1.20333 * time.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.495 * time.superlayer!.bounds.width, y: 0.5 * time.superlayer!.bounds.height))]
		timePositionAnim.keyTimes  = [0, 1]
		timePositionAnim.duration  = 0.312
		timePositionAnim.beginTime = 1.95
		
		let timeStickersAnim : CAAnimationGroup = QCMethod.group(animations: [timePositionAnim], fillMode:fillMode)
		time.add(timeStickersAnim, forKey:"timeStickersAnim")
		
		let cinema = layers["cinema"] as! CALayer
		
		////Cinema animation
		let cinemaPositionAnim       = CAKeyframeAnimation(keyPath:"position")
		cinemaPositionAnim.values    = [NSValue(cgPoint: CGPoint(x: 0.8 * cinema.superlayer!.bounds.width, y: 1.20333 * cinema.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.8 * cinema.superlayer!.bounds.width, y: 0.5 * cinema.superlayer!.bounds.height))]
		cinemaPositionAnim.keyTimes  = [0, 1]
		cinemaPositionAnim.duration  = 0.332
		cinemaPositionAnim.beginTime = 2.1
		
		let cinemaStickersAnim : CAAnimationGroup = QCMethod.group(animations: [cinemaPositionAnim], fillMode:fillMode)
		cinema.add(cinemaStickersAnim, forKey:"cinemaStickersAnim")
	}
	
	//MARK: - Animation Cleanup
	
	func animationDidStop(_ anim: CAAnimation, finished flag: Bool){
		if let completionBlock = completionBlocks[anim]{
			completionBlocks.removeValue(forKey: anim)
			if (flag && updateLayerValueForCompletedAnimation) || anim.value(forKey: "needEndAnim") as! Bool{
				updateLayerValues(forAnimationId: anim.value(forKey: "animId") as! String)
				removeAnimations(forAnimationId: anim.value(forKey: "animId") as! String)
			}
			completionBlock(flag)
		}
	}
	
	func updateLayerValues(forAnimationId identifier: String){
		if identifier == "Stickers"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["PigBank"] as! CALayer).animation(forKey: "PigBankStickersAnim"), theLayer:(layers["PigBank"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["coin"] as! CALayer).animation(forKey: "coinStickersAnim"), theLayer:(layers["coin"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["cabelo"] as! CALayer).animation(forKey: "cabeloStickersAnim"), theLayer:(layers["cabelo"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["time"] as! CALayer).animation(forKey: "timeStickersAnim"), theLayer:(layers["time"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["cinema"] as! CALayer).animation(forKey: "cinemaStickersAnim"), theLayer:(layers["cinema"] as! CALayer))
		}
	}
	
	func removeAnimations(forAnimationId identifier: String){
		if identifier == "Stickers"{
			(layers["PigBank"] as! CALayer).removeAnimation(forKey: "PigBankStickersAnim")
			(layers["coin"] as! CALayer).removeAnimation(forKey: "coinStickersAnim")
			(layers["cabelo"] as! CALayer).removeAnimation(forKey: "cabeloStickersAnim")
			(layers["time"] as! CALayer).removeAnimation(forKey: "timeStickersAnim")
			(layers["cinema"] as! CALayer).removeAnimation(forKey: "cinemaStickersAnim")
		}
	}
	
	func removeAllAnimations(){
		for layer in layers.values{
			(layer as! CALayer).removeAllAnimations()
		}
	}
	
}
