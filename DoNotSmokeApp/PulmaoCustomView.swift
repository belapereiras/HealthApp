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
	
	
	
	func setupProperties(){
		
	}
	
	func setupLayers(){
		let pulmao = CALayer()
		pulmao.frame = CGRect(x: 3.5, y: 17.38, width: 193.71, height: 167.68)
		self.layer.addSublayer(pulmao)
		layers["pulmao"] = pulmao
		
		let path = CAShapeLayer()
		path.frame = CGRect(x: 0, y: 200, width: 0, height: 0)
		path.path = pathPath().cgPath
		self.layer.addSublayer(path)
		layers["path"] = path
		
		let BShine1 = CALayer()
		BShine1.frame = CGRect(x: 36.98, y: 52.01, width: 32.85, height: 32.85)
		self.layer.addSublayer(BShine1)
		layers["BShine1"] = BShine1
		
		let BShine5 = CALayer()
		BShine5.frame = CGRect(x: 67.95, y: 111.6, width: 14.35, height: 14.35)
		self.layer.addSublayer(BShine5)
		layers["BShine5"] = BShine5
		
		let BShine2 = CALayer()
		BShine2.frame = CGRect(x: 138.13, y: 88.43, width: 25.57, height: 25.57)
		self.layer.addSublayer(BShine2)
		layers["BShine2"] = BShine2
		
		let BShine3 = CALayer()
		BShine3.frame = CGRect(x: 12.7, y: 152, width: 25.57, height: 25.57)
		self.layer.addSublayer(BShine3)
		layers["BShine3"] = BShine3
		
		let BShine4 = CALayer()
		BShine4.frame = CGRect(x: 128.84, y: 144.8, width: 19.98, height: 19.98)
		self.layer.addSublayer(BShine4)
		layers["BShine4"] = BShine4
		
		let BShine6 = CALayer()
		BShine6.frame = CGRect(x: 128.84, y: 47.09, width: 12.4, height: 12.4)
		self.layer.addSublayer(BShine6)
		layers["BShine6"] = BShine6
		
		resetLayerProperties(forLayerIdentifiers: nil)
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
	
	//MARK: - Animation Setup
	
	func addPulmao(){
		let fillMode : String = kCAFillModeForwards
		
		////An infinity animation
		
		////BShine1 animation
		let BShine1TransformAnim         = CAKeyframeAnimation(keyPath:"transform")
		BShine1TransformAnim.values      = [NSValue(caTransform3D: CATransform3DIdentity), 
			 NSValue(caTransform3D: CATransform3DMakeScale(0.3, 0.3, 1)), 
			 NSValue(caTransform3D: CATransform3DIdentity)]
		BShine1TransformAnim.keyTimes    = [0, 0.499, 1]
		BShine1TransformAnim.duration    = 1.52
		BShine1TransformAnim.repeatCount = Float.infinity
		
		let BShine1Pulmao_animationAnim : CAAnimationGroup = QCMethod.group(animations: [BShine1TransformAnim], fillMode:fillMode)
		layers["BShine1"]?.add(BShine1Pulmao_animationAnim, forKey:"BShine1Pulmao_animationAnim")
		
		////BShine5 animation
		let BShine5TransformAnim         = CAKeyframeAnimation(keyPath:"transform")
		BShine5TransformAnim.values      = [NSValue(caTransform3D: CATransform3DIdentity), 
			 NSValue(caTransform3D: CATransform3DMakeScale(2.1, 2.1, 1)), 
			 NSValue(caTransform3D: CATransform3DIdentity)]
		BShine5TransformAnim.keyTimes    = [0, 0.498, 1]
		BShine5TransformAnim.duration    = 1.52
		BShine5TransformAnim.repeatCount = Float.infinity
		
		let BShine5Pulmao_animationAnim : CAAnimationGroup = QCMethod.group(animations: [BShine5TransformAnim], fillMode:fillMode)
		layers["BShine5"]?.add(BShine5Pulmao_animationAnim, forKey:"BShine5Pulmao_animationAnim")
		
		////BShine2 animation
		let BShine2TransformAnim         = CAKeyframeAnimation(keyPath:"transform")
		BShine2TransformAnim.values      = [NSValue(caTransform3D: CATransform3DIdentity), 
			 NSValue(caTransform3D: CATransform3DMakeScale(0.5, 0.5, 1)), 
			 NSValue(caTransform3D: CATransform3DIdentity)]
		BShine2TransformAnim.keyTimes    = [0, 0.499, 1]
		BShine2TransformAnim.duration    = 1.52
		BShine2TransformAnim.repeatCount = Float.infinity
		
		let BShine2Pulmao_animationAnim : CAAnimationGroup = QCMethod.group(animations: [BShine2TransformAnim], fillMode:fillMode)
		layers["BShine2"]?.add(BShine2Pulmao_animationAnim, forKey:"BShine2Pulmao_animationAnim")
		
		////BShine3 animation
		let BShine3TransformAnim         = CAKeyframeAnimation(keyPath:"transform")
		BShine3TransformAnim.values      = [NSValue(caTransform3D: CATransform3DMakeScale(1.5, 1.5, 1)), 
			 NSValue(caTransform3D: CATransform3DMakeScale(0.3, 0.3, 1)), 
			 NSValue(caTransform3D: CATransform3DMakeScale(1.5, 1.5, 1))]
		BShine3TransformAnim.keyTimes    = [0, 0.499, 1]
		BShine3TransformAnim.duration    = 1.52
		BShine3TransformAnim.repeatCount = Float.infinity
		
		let BShine3Pulmao_animationAnim : CAAnimationGroup = QCMethod.group(animations: [BShine3TransformAnim], fillMode:fillMode)
		layers["BShine3"]?.add(BShine3Pulmao_animationAnim, forKey:"BShine3Pulmao_animationAnim")
		
		////BShine4 animation
		let BShine4TransformAnim         = CAKeyframeAnimation(keyPath:"transform")
		BShine4TransformAnim.values      = [NSValue(caTransform3D: CATransform3DIdentity), 
			 NSValue(caTransform3D: CATransform3DMakeScale(2.5, 2.5, 1)), 
			 NSValue(caTransform3D: CATransform3DIdentity)]
		BShine4TransformAnim.keyTimes    = [0, 0.497, 1]
		BShine4TransformAnim.duration    = 1.52
		BShine4TransformAnim.repeatCount = Float.infinity
		
		let BShine4Pulmao_animationAnim : CAAnimationGroup = QCMethod.group(animations: [BShine4TransformAnim], fillMode:fillMode)
		layers["BShine4"]?.add(BShine4Pulmao_animationAnim, forKey:"BShine4Pulmao_animationAnim")
		
		////BShine6 animation
		let BShine6TransformAnim         = CAKeyframeAnimation(keyPath:"transform")
		BShine6TransformAnim.values      = [NSValue(caTransform3D: CATransform3DIdentity), 
			 NSValue(caTransform3D: CATransform3DMakeScale(2.3, 2.3, 1)), 
			 NSValue(caTransform3D: CATransform3DIdentity)]
		BShine6TransformAnim.keyTimes    = [0, 0.498, 1]
		BShine6TransformAnim.duration    = 1.52
		BShine6TransformAnim.repeatCount = Float.infinity
		
		let BShine6Pulmao_animationAnim : CAAnimationGroup = QCMethod.group(animations: [BShine6TransformAnim], fillMode:fillMode)
		layers["BShine6"]?.add(BShine6Pulmao_animationAnim, forKey:"BShine6Pulmao_animationAnim")
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
	
	func pathPath() -> UIBezierPath{
		let pathPath = UIBezierPath()
		pathPath.move(to: CGPoint(x: -27.004, y: -64.667))
		
		return pathPath
	}
	
	
}
