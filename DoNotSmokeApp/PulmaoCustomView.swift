//
//  PulmaoCustomView.swift
//
//  Code generated using QuartzCode 1.55.0 on 2/10/17.
//  www.quartzcodeapp.com
//

import UIKit

@IBDesignable
class PulmaoCustomView: UIView, CAAnimationDelegate {
	
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
		let pulmao = CALayer()
		self.layer.addSublayer(pulmao)
		layers["pulmao"] = pulmao
		
		let path = CAShapeLayer()
		self.layer.addSublayer(path)
		layers["path"] = path
		
		let BShine1 = CALayer()
		self.layer.addSublayer(BShine1)
		layers["BShine1"] = BShine1
		
		let BShine5 = CALayer()
		self.layer.addSublayer(BShine5)
		layers["BShine5"] = BShine5
		
		let BShine2 = CALayer()
		self.layer.addSublayer(BShine2)
		layers["BShine2"] = BShine2
		
		let BShine3 = CALayer()
		self.layer.addSublayer(BShine3)
		layers["BShine3"] = BShine3
		
		let BShine4 = CALayer()
		self.layer.addSublayer(BShine4)
		layers["BShine4"] = BShine4
		
		let BShine6 = CALayer()
		self.layer.addSublayer(BShine6)
		layers["BShine6"] = BShine6
		
		resetLayerProperties(forLayerIdentifiers: nil)
		setupLayerFrames()
	}
	
	func resetLayerProperties(forLayerIdentifiers layerIds: [String]!){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if layerIds == nil || layerIds.contains("pulmao"){
			let pulmao = layers["pulmao"] as! CALayer
			pulmao.contents = UIImage(named:"pulmao")?.cgImage
		}
		if layerIds == nil || layerIds.contains("path"){
			let path = layers["path"] as! CAShapeLayer
			path.fillColor   = nil
			path.strokeColor = UIColor.black.cgColor
		}
		if layerIds == nil || layerIds.contains("BShine1"){
			let BShine1 = layers["BShine1"] as! CALayer
			BShine1.contents = UIImage(named:"BShine1")?.cgImage
		}
		if layerIds == nil || layerIds.contains("BShine5"){
			let BShine5 = layers["BShine5"] as! CALayer
			BShine5.contents = UIImage(named:"BShine5")?.cgImage
		}
		if layerIds == nil || layerIds.contains("BShine2"){
			let BShine2 = layers["BShine2"] as! CALayer
			BShine2.contents = UIImage(named:"BShine2")?.cgImage
		}
		if layerIds == nil || layerIds.contains("BShine3"){
			let BShine3 = layers["BShine3"] as! CALayer
			BShine3.contents = UIImage(named:"BShine3")?.cgImage
		}
		if layerIds == nil || layerIds.contains("BShine4"){
			let BShine4 = layers["BShine4"] as! CALayer
			BShine4.contents = UIImage(named:"BShine4")?.cgImage
		}
		if layerIds == nil || layerIds.contains("BShine6"){
			let BShine6 = layers["BShine6"] as! CALayer
			BShine6.contents = UIImage(named:"BShine6")?.cgImage
		}
		
		CATransaction.commit()
	}
	
	func setupLayerFrames(){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if let pulmao : CALayer = layers["pulmao"] as? CALayer{
			pulmao.frame = CGRect(x: 0.0175 * pulmao.superlayer!.bounds.width, y: 0.08688 * pulmao.superlayer!.bounds.height, width: 0.96853 * pulmao.superlayer!.bounds.width, height: 0.83838 * pulmao.superlayer!.bounds.height)
		}
		
		if let path : CAShapeLayer = layers["path"] as? CAShapeLayer{
			path.frame = CGRect(x: 0, y:  path.superlayer!.bounds.height, width: 0, height: 0)
			path.path  = pathPath(bounds: (layers["path"] as! CAShapeLayer).bounds).cgPath
		}
		
		if let BShine1 : CALayer = layers["BShine1"] as? CALayer{
			BShine1.frame = CGRect(x: 0.18491 * BShine1.superlayer!.bounds.width, y: 0.26005 * BShine1.superlayer!.bounds.height, width: 0.16424 * BShine1.superlayer!.bounds.width, height: 0.16424 * BShine1.superlayer!.bounds.height)
		}
		
		if let BShine5 : CALayer = layers["BShine5"] as? CALayer{
			BShine5.frame = CGRect(x: 0.33974 * BShine5.superlayer!.bounds.width, y: 0.558 * BShine5.superlayer!.bounds.height, width: 0.07174 * BShine5.superlayer!.bounds.width, height: 0.07174 * BShine5.superlayer!.bounds.height)
		}
		
		if let BShine2 : CALayer = layers["BShine2"] as? CALayer{
			BShine2.frame = CGRect(x: 0.69066 * BShine2.superlayer!.bounds.width, y: 0.44216 * BShine2.superlayer!.bounds.height, width: 0.12783 * BShine2.superlayer!.bounds.width, height: 0.12783 * BShine2.superlayer!.bounds.height)
		}
		
		if let BShine3 : CALayer = layers["BShine3"] as? CALayer{
			BShine3.frame = CGRect(x: 0.06352 * BShine3.superlayer!.bounds.width, y: 0.75998 * BShine3.superlayer!.bounds.height, width: 0.12783 * BShine3.superlayer!.bounds.width, height: 0.12783 * BShine3.superlayer!.bounds.height)
		}
		
		if let BShine4 : CALayer = layers["BShine4"] as? CALayer{
			BShine4.frame = CGRect(x: 0.6442 * BShine4.superlayer!.bounds.width, y: 0.72402 * BShine4.superlayer!.bounds.height, width: 0.09991 * BShine4.superlayer!.bounds.width, height: 0.09991 * BShine4.superlayer!.bounds.height)
		}
		
		if let BShine6 : CALayer = layers["BShine6"] as? CALayer{
			BShine6.frame = CGRect(x: 0.64421 * BShine6.superlayer!.bounds.width, y: 0.23543 * BShine6.superlayer!.bounds.height, width: 0.062 * BShine6.superlayer!.bounds.width, height: 0.062 * BShine6.superlayer!.bounds.height)
		}
		
		CATransaction.commit()
	}
	
	//MARK: - Animation Setup
	
	func addPulmao(){
		let fillMode : String = kCAFillModeForwards
		
		////An infinity animation
		
		let BShine1 = layers["BShine1"] as! CALayer
		
		////BShine1 animation
		let BShine1TransformAnim         = CAKeyframeAnimation(keyPath:"transform")
		BShine1TransformAnim.values      = [NSValue(caTransform3D: CATransform3DIdentity), 
			 NSValue(caTransform3D: CATransform3DMakeScale(0.3, 0.3, 1)), 
			 NSValue(caTransform3D: CATransform3DIdentity)]
		BShine1TransformAnim.keyTimes    = [0, 0.499, 1]
		BShine1TransformAnim.duration    = 1.52
		BShine1TransformAnim.repeatCount = Float.infinity
		
		let BShine1Pulmao_animationAnim : CAAnimationGroup = QCMethod.group(animations: [BShine1TransformAnim], fillMode:fillMode)
		BShine1.add(BShine1Pulmao_animationAnim, forKey:"BShine1Pulmao_animationAnim")
		
		let BShine5 = layers["BShine5"] as! CALayer
		
		////BShine5 animation
		let BShine5TransformAnim         = CAKeyframeAnimation(keyPath:"transform")
		BShine5TransformAnim.values      = [NSValue(caTransform3D: CATransform3DIdentity), 
			 NSValue(caTransform3D: CATransform3DMakeScale(2.1, 2.1, 1)), 
			 NSValue(caTransform3D: CATransform3DIdentity)]
		BShine5TransformAnim.keyTimes    = [0, 0.498, 1]
		BShine5TransformAnim.duration    = 1.52
		BShine5TransformAnim.repeatCount = Float.infinity
		
		let BShine5Pulmao_animationAnim : CAAnimationGroup = QCMethod.group(animations: [BShine5TransformAnim], fillMode:fillMode)
		BShine5.add(BShine5Pulmao_animationAnim, forKey:"BShine5Pulmao_animationAnim")
		
		let BShine2 = layers["BShine2"] as! CALayer
		
		////BShine2 animation
		let BShine2TransformAnim         = CAKeyframeAnimation(keyPath:"transform")
		BShine2TransformAnim.values      = [NSValue(caTransform3D: CATransform3DIdentity), 
			 NSValue(caTransform3D: CATransform3DMakeScale(0.5, 0.5, 1)), 
			 NSValue(caTransform3D: CATransform3DIdentity)]
		BShine2TransformAnim.keyTimes    = [0, 0.499, 1]
		BShine2TransformAnim.duration    = 1.52
		BShine2TransformAnim.repeatCount = Float.infinity
		
		let BShine2Pulmao_animationAnim : CAAnimationGroup = QCMethod.group(animations: [BShine2TransformAnim], fillMode:fillMode)
		BShine2.add(BShine2Pulmao_animationAnim, forKey:"BShine2Pulmao_animationAnim")
		
		let BShine3 = layers["BShine3"] as! CALayer
		
		////BShine3 animation
		let BShine3TransformAnim         = CAKeyframeAnimation(keyPath:"transform")
		BShine3TransformAnim.values      = [NSValue(caTransform3D: CATransform3DMakeScale(1.5, 1.5, 1)), 
			 NSValue(caTransform3D: CATransform3DMakeScale(0.3, 0.3, 1)), 
			 NSValue(caTransform3D: CATransform3DMakeScale(1.5, 1.5, 1))]
		BShine3TransformAnim.keyTimes    = [0, 0.499, 1]
		BShine3TransformAnim.duration    = 1.52
		BShine3TransformAnim.repeatCount = Float.infinity
		
		let BShine3Pulmao_animationAnim : CAAnimationGroup = QCMethod.group(animations: [BShine3TransformAnim], fillMode:fillMode)
		BShine3.add(BShine3Pulmao_animationAnim, forKey:"BShine3Pulmao_animationAnim")
		
		let BShine4 = layers["BShine4"] as! CALayer
		
		////BShine4 animation
		let BShine4TransformAnim         = CAKeyframeAnimation(keyPath:"transform")
		BShine4TransformAnim.values      = [NSValue(caTransform3D: CATransform3DIdentity), 
			 NSValue(caTransform3D: CATransform3DMakeScale(2.5, 2.5, 1)), 
			 NSValue(caTransform3D: CATransform3DIdentity)]
		BShine4TransformAnim.keyTimes    = [0, 0.497, 1]
		BShine4TransformAnim.duration    = 1.52
		BShine4TransformAnim.repeatCount = Float.infinity
		
		let BShine4Pulmao_animationAnim : CAAnimationGroup = QCMethod.group(animations: [BShine4TransformAnim], fillMode:fillMode)
		BShine4.add(BShine4Pulmao_animationAnim, forKey:"BShine4Pulmao_animationAnim")
		
		let BShine6 = layers["BShine6"] as! CALayer
		
		////BShine6 animation
		let BShine6TransformAnim         = CAKeyframeAnimation(keyPath:"transform")
		BShine6TransformAnim.values      = [NSValue(caTransform3D: CATransform3DIdentity), 
			 NSValue(caTransform3D: CATransform3DMakeScale(2.3, 2.3, 1)), 
			 NSValue(caTransform3D: CATransform3DIdentity)]
		BShine6TransformAnim.keyTimes    = [0, 0.498, 1]
		BShine6TransformAnim.duration    = 1.52
		BShine6TransformAnim.repeatCount = Float.infinity
		
		let BShine6Pulmao_animationAnim : CAAnimationGroup = QCMethod.group(animations: [BShine6TransformAnim], fillMode:fillMode)
		BShine6.add(BShine6Pulmao_animationAnim, forKey:"BShine6Pulmao_animationAnim")
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
		if identifier == "pulmao_animation"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["BShine1"] as! CALayer).animation(forKey: "BShine1Pulmao_animationAnim"), theLayer:(layers["BShine1"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["BShine5"] as! CALayer).animation(forKey: "BShine5Pulmao_animationAnim"), theLayer:(layers["BShine5"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["BShine2"] as! CALayer).animation(forKey: "BShine2Pulmao_animationAnim"), theLayer:(layers["BShine2"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["BShine3"] as! CALayer).animation(forKey: "BShine3Pulmao_animationAnim"), theLayer:(layers["BShine3"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["BShine4"] as! CALayer).animation(forKey: "BShine4Pulmao_animationAnim"), theLayer:(layers["BShine4"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["BShine6"] as! CALayer).animation(forKey: "BShine6Pulmao_animationAnim"), theLayer:(layers["BShine6"] as! CALayer))
		}
	}
	
	func removeAnimations(forAnimationId identifier: String){
		if identifier == "pulmao_animation"{
			(layers["BShine1"] as! CALayer).removeAnimation(forKey: "BShine1Pulmao_animationAnim")
			(layers["BShine5"] as! CALayer).removeAnimation(forKey: "BShine5Pulmao_animationAnim")
			(layers["BShine2"] as! CALayer).removeAnimation(forKey: "BShine2Pulmao_animationAnim")
			(layers["BShine3"] as! CALayer).removeAnimation(forKey: "BShine3Pulmao_animationAnim")
			(layers["BShine4"] as! CALayer).removeAnimation(forKey: "BShine4Pulmao_animationAnim")
			(layers["BShine6"] as! CALayer).removeAnimation(forKey: "BShine6Pulmao_animationAnim")
		}
	}
	
	func removeAllAnimations(){
		for layer in layers.values{
			(layer as! CALayer).removeAllAnimations()
		}
	}
	
	//MARK: - Bezier Path
	
	func pathPath(bounds: CGRect) -> UIBezierPath{
		let pathPath = UIBezierPath()
		//bounds height or width must be higher than 0!
		
		return pathPath
	}
	
	
}
