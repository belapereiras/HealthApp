//
//  Tutorial1View.swift
//
//  Code generated using QuartzCode 1.55.0 on 2/22/17.
//  www.quartzcodeapp.com
//

import UIKit

@IBDesignable
class Tutorial1View: UIView, CAAnimationDelegate {
	
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
		let DontSmoke = CALayer()
		self.layer.addSublayer(DontSmoke)
		layers["DontSmoke"] = DontSmoke
		let half = CALayer()
		DontSmoke.addSublayer(half)
		layers["half"] = half
		let half2 = CALayer()
		DontSmoke.addSublayer(half2)
		layers["half2"] = half2
		let smoke = CALayer()
		DontSmoke.addSublayer(smoke)
		layers["smoke"] = smoke
		let smoke2 = CALayer()
		DontSmoke.addSublayer(smoke2)
		layers["smoke2"] = smoke2
		
		let prog = CALayer()
		self.layer.addSublayer(prog)
		layers["prog"] = prog
		
		let prog2 = CALayer()
		self.layer.addSublayer(prog2)
		layers["prog2"] = prog2
		
		let prog3 = CALayer()
		self.layer.addSublayer(prog3)
		layers["prog3"] = prog3
		
		resetLayerProperties(forLayerIdentifiers: nil)
		setupLayerFrames()
	}
	
	func resetLayerProperties(forLayerIdentifiers layerIds: [String]!){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if layerIds == nil || layerIds.contains("half"){
			let half = layers["half"] as! CALayer
			half.contents = UIImage(named:"half1")?.cgImage
		}
		if layerIds == nil || layerIds.contains("half2"){
			let half2 = layers["half2"] as! CALayer
			half2.contents = UIImage(named:"half2")?.cgImage
		}
		if layerIds == nil || layerIds.contains("smoke"){
			let smoke = layers["smoke"] as! CALayer
			smoke.contents = UIImage(named:"smoke1")?.cgImage
		}
		if layerIds == nil || layerIds.contains("smoke2"){
			let smoke2 = layers["smoke2"] as! CALayer
			smoke2.contents = UIImage(named:"smoke2")?.cgImage
		}
		if layerIds == nil || layerIds.contains("prog"){
			let prog = layers["prog"] as! CALayer
			prog.anchorPoint = CGPoint(x: 0, y: 1)
			prog.frame       = CGRect(x: 0.2234 * prog.superlayer!.bounds.width, y: 1.27333 * prog.superlayer!.bounds.height, width: 0.7766 * prog.superlayer!.bounds.width, height: 0.23667 * prog.superlayer!.bounds.height)
			prog.contents    = UIImage(named:"prog1")?.cgImage
		}
		if layerIds == nil || layerIds.contains("prog2"){
			let prog2 = layers["prog2"] as! CALayer
			prog2.anchorPoint = CGPoint(x: 0, y: 1)
			prog2.frame       = CGRect(x: 0.13963 * prog2.superlayer!.bounds.width, y: 0.22667 * prog2.superlayer!.bounds.height, width: 0.68085 * prog2.superlayer!.bounds.width, height: 0.23667 * prog2.superlayer!.bounds.height)
			prog2.contents    = UIImage(named:"prog2")?.cgImage
		}
		if layerIds == nil || layerIds.contains("prog3"){
			let prog3 = layers["prog3"] as! CALayer
			prog3.contents = UIImage(named:"prog3")?.cgImage
		}
		
		CATransaction.commit()
	}
	
	func setupLayerFrames(){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if let DontSmoke : CALayer = layers["DontSmoke"] as? CALayer{
			DontSmoke.frame = CGRect(x: 0.13963 * DontSmoke.superlayer!.bounds.width, y: 0.17 * DontSmoke.superlayer!.bounds.height, width: 0.75266 * DontSmoke.superlayer!.bounds.width, height: 0.58667 * DontSmoke.superlayer!.bounds.height)
		}
		
		if let half : CALayer = layers["half"] as? CALayer{
			half.frame = CGRect(x: 0, y: 0.79545 * half.superlayer!.bounds.height, width: 0.47703 * half.superlayer!.bounds.width, height: 0.20455 * half.superlayer!.bounds.height)
		}
		
		if let half2 : CALayer = layers["half2"] as? CALayer{
			half2.frame = CGRect(x: 0.4629 * half2.superlayer!.bounds.width, y: 0.79545 * half2.superlayer!.bounds.height, width: 0.5371 * half2.superlayer!.bounds.width, height: 0.20455 * half2.superlayer!.bounds.height)
		}
		
		if let smoke : CALayer = layers["smoke"] as? CALayer{
			smoke.frame = CGRect(x: 0.00353 * smoke.superlayer!.bounds.width, y: 0.09659 * smoke.superlayer!.bounds.height, width: 0.32155 * smoke.superlayer!.bounds.width, height: 0.65341 * smoke.superlayer!.bounds.height)
		}
		
		if let smoke2 : CALayer = layers["smoke2"] as? CALayer{
			smoke2.frame = CGRect(x: 0.06122 * smoke2.superlayer!.bounds.width, y: 0, width: 0.36281 * smoke2.superlayer!.bounds.width, height: 0.74432 * smoke2.superlayer!.bounds.height)
		}
		
		if let prog : CALayer = layers["prog"] as? CALayer{
			prog.frame = CGRect(x: 0.2234 * prog.superlayer!.bounds.width, y: 1.27333 * prog.superlayer!.bounds.height, width: 0.7766 * prog.superlayer!.bounds.width, height: 0.23667 * prog.superlayer!.bounds.height)
		}
		
		if let prog2 : CALayer = layers["prog2"] as? CALayer{
			prog2.frame = CGRect(x: 0.13963 * prog2.superlayer!.bounds.width, y: 0.22667 * prog2.superlayer!.bounds.height, width: 0.68085 * prog2.superlayer!.bounds.width, height: 0.23667 * prog2.superlayer!.bounds.height)
		}
		
		if let prog3 : CALayer = layers["prog3"] as? CALayer{
			prog3.frame = CGRect(x: 0.13963 * prog3.superlayer!.bounds.width, y: 0.46667 * prog3.superlayer!.bounds.height, width: 0.67553 * prog3.superlayer!.bounds.width, height: 0.29 * prog3.superlayer!.bounds.height)
		}
		
		CATransaction.commit()
	}
	
	//MARK: - Animation Setup
	
	func addProgressAnimation(){
		let fillMode : String = kCAFillModeForwards
		
		////An infinity animation
		
		let half = layers["half"] as! CALayer
		
		////Half animation
		let halfTransformAnim       = CAKeyframeAnimation(keyPath:"transform")
		halfTransformAnim.values    = [NSValue(caTransform3D: CATransform3DIdentity), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(-40 * CGFloat(M_PI/180), -1, 0, 1))]
		halfTransformAnim.keyTimes  = [0, 1]
		halfTransformAnim.duration  = 0.582
		halfTransformAnim.beginTime = 2.16
		
		let halfOpacityAnim       = CAKeyframeAnimation(keyPath:"opacity")
		halfOpacityAnim.values    = [1, 0]
		halfOpacityAnim.keyTimes  = [0, 1]
		halfOpacityAnim.duration  = 0.355
		halfOpacityAnim.beginTime = 2.84
		
		let halfProgressAnim : CAAnimationGroup = QCMethod.group(animations: [halfTransformAnim, halfOpacityAnim], fillMode:fillMode)
		half.add(halfProgressAnim, forKey:"halfProgressAnim")
		
		let half2 = layers["half2"] as! CALayer
		
		////Half2 animation
		let half2TransformAnim            = CAKeyframeAnimation(keyPath:"transform")
		half2TransformAnim.values         = [NSValue(caTransform3D: CATransform3DIdentity), 
			 NSValue(caTransform3D: CATransform3DMakeRotation(40 * CGFloat(M_PI/180), -1, -0, 1))]
		half2TransformAnim.keyTimes       = [0, 1]
		half2TransformAnim.duration       = 0.578
		half2TransformAnim.beginTime      = 2.17
		half2TransformAnim.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseOut)
		
		let half2OpacityAnim       = CAKeyframeAnimation(keyPath:"opacity")
		half2OpacityAnim.values    = [1, 0]
		half2OpacityAnim.keyTimes  = [0, 1]
		half2OpacityAnim.duration  = 0.355
		half2OpacityAnim.beginTime = 2.84
		
		let half2ProgressAnim : CAAnimationGroup = QCMethod.group(animations: [half2TransformAnim, half2OpacityAnim], fillMode:fillMode)
		half2.add(half2ProgressAnim, forKey:"half2ProgressAnim")
		
		////Smoke animation
		let smokeOpacityAnim       = CAKeyframeAnimation(keyPath:"opacity")
		smokeOpacityAnim.values    = [1, 0]
		smokeOpacityAnim.keyTimes  = [0, 1]
		smokeOpacityAnim.duration  = 0.628
		smokeOpacityAnim.beginTime = 2.57
		
		let smoke = layers["smoke"] as! CALayer
		
		let smokePositionAnim          = CAKeyframeAnimation(keyPath:"position")
		smokePositionAnim.values       = [NSValue(cgPoint: CGPoint(x: 0.16431 * smoke.superlayer!.bounds.width, y: 0.4233 * smoke.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.16431 * smoke.superlayer!.bounds.width, y: 0.36932 * smoke.superlayer!.bounds.height))]
		smokePositionAnim.keyTimes     = [0, 1]
		smokePositionAnim.duration     = 0.759
		smokePositionAnim.repeatCount  = Float.infinity
		smokePositionAnim.autoreverses = true
		
		let smokeProgressAnim : CAAnimationGroup = QCMethod.group(animations: [smokeOpacityAnim, smokePositionAnim], fillMode:fillMode)
		smoke.add(smokeProgressAnim, forKey:"smokeProgressAnim")
		
		////Smoke2 animation
		let smoke2OpacityAnim       = CAKeyframeAnimation(keyPath:"opacity")
		smoke2OpacityAnim.values    = [1, 0]
		smoke2OpacityAnim.keyTimes  = [0, 1]
		smoke2OpacityAnim.duration  = 0.628
		smoke2OpacityAnim.beginTime = 2.57
		
		let smoke2 = layers["smoke2"] as! CALayer
		
		let smoke2PositionAnim          = CAKeyframeAnimation(keyPath:"position")
		smoke2PositionAnim.values       = [NSValue(cgPoint: CGPoint(x: 0.24262 * smoke2.superlayer!.bounds.width, y: 0.37216 * smoke2.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.24262 * smoke2.superlayer!.bounds.width, y: 0.33523 * smoke2.superlayer!.bounds.height))]
		smoke2PositionAnim.keyTimes     = [0, 1]
		smoke2PositionAnim.duration     = 0.759
		smoke2PositionAnim.repeatCount  = Float.infinity
		smoke2PositionAnim.autoreverses = true
		
		let smoke2ProgressAnim : CAAnimationGroup = QCMethod.group(animations: [smoke2OpacityAnim, smoke2PositionAnim], fillMode:fillMode)
		smoke2.add(smoke2ProgressAnim, forKey:"smoke2ProgressAnim")
		
		let prog = layers["prog"] as! CALayer
		
		////Prog animation
		let progPositionAnim       = CAKeyframeAnimation(keyPath:"position")
		progPositionAnim.values    = [NSValue(cgPoint: CGPoint(x: 0.08511 * prog.superlayer!.bounds.width, y: 1.23667 * prog.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.08511 * prog.superlayer!.bounds.width, y: 0.31 * prog.superlayer!.bounds.height))]
		progPositionAnim.keyTimes  = [0, 1]
		progPositionAnim.duration  = 0.49
		progPositionAnim.beginTime = 3.47
		
		let progOpacityAnim      = CAKeyframeAnimation(keyPath:"opacity")
		progOpacityAnim.values   = [0, 0, 1]
		progOpacityAnim.keyTimes = [0, 0.999, 1]
		progOpacityAnim.duration = 3.48
		
		let progProgressAnim : CAAnimationGroup = QCMethod.group(animations: [progPositionAnim, progOpacityAnim], fillMode:fillMode)
		prog.add(progProgressAnim, forKey:"progProgressAnim")
		
		let prog2 = layers["prog2"] as! CALayer
		
		////Prog2 animation
		let prog2PositionAnim       = CAKeyframeAnimation(keyPath:"position")
		prog2PositionAnim.values    = [NSValue(cgPoint: CGPoint(x: 0.08511 * prog2.superlayer!.bounds.width, y: 1.23667 * prog2.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.08511 * prog2.superlayer!.bounds.width, y: 0.62 * prog2.superlayer!.bounds.height))]
		prog2PositionAnim.keyTimes  = [0, 1]
		prog2PositionAnim.duration  = 0.59
		prog2PositionAnim.beginTime = 3.47
		
		let prog2OpacityAnim      = CAKeyframeAnimation(keyPath:"opacity")
		prog2OpacityAnim.values   = [0, 0, 1]
		prog2OpacityAnim.keyTimes = [0, 0.999, 1]
		prog2OpacityAnim.duration = 3.48
		
		let prog2ProgressAnim : CAAnimationGroup = QCMethod.group(animations: [prog2PositionAnim, prog2OpacityAnim], fillMode:fillMode)
		prog2.add(prog2ProgressAnim, forKey:"prog2ProgressAnim")
		
		let prog3 = layers["prog3"] as! CALayer
		
		////Prog3 animation
		let prog3PositionAnim       = CAKeyframeAnimation(keyPath:"position")
		prog3PositionAnim.values    = [NSValue(cgPoint: CGPoint(x: 0.42287 * prog3.superlayer!.bounds.width, y: 1.15 * prog3.superlayer!.bounds.height)), NSValue(cgPoint: CGPoint(x: 0.42287 * prog3.superlayer!.bounds.width, y: 0.81667 * prog3.superlayer!.bounds.height))]
		prog3PositionAnim.keyTimes  = [0, 1]
		prog3PositionAnim.duration  = 0.69
		prog3PositionAnim.beginTime = 3.47
		
		let prog3OpacityAnim      = CAKeyframeAnimation(keyPath:"opacity")
		prog3OpacityAnim.values   = [0, 0, 1]
		prog3OpacityAnim.keyTimes = [0, 0.999, 1]
		prog3OpacityAnim.duration = 3.48
		
		let prog3ProgressAnim : CAAnimationGroup = QCMethod.group(animations: [prog3PositionAnim, prog3OpacityAnim], fillMode:fillMode)
		prog3.add(prog3ProgressAnim, forKey:"prog3ProgressAnim")
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
		if identifier == "progress"{
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["half"] as! CALayer).animation(forKey: "halfProgressAnim"), theLayer:(layers["half"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["half2"] as! CALayer).animation(forKey: "half2ProgressAnim"), theLayer:(layers["half2"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["smoke"] as! CALayer).animation(forKey: "smokeProgressAnim"), theLayer:(layers["smoke"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["smoke2"] as! CALayer).animation(forKey: "smoke2ProgressAnim"), theLayer:(layers["smoke2"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["prog"] as! CALayer).animation(forKey: "progProgressAnim"), theLayer:(layers["prog"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["prog2"] as! CALayer).animation(forKey: "prog2ProgressAnim"), theLayer:(layers["prog2"] as! CALayer))
			QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["prog3"] as! CALayer).animation(forKey: "prog3ProgressAnim"), theLayer:(layers["prog3"] as! CALayer))
		}
	}
	
	func removeAnimations(forAnimationId identifier: String){
		if identifier == "progress"{
			(layers["half"] as! CALayer).removeAnimation(forKey: "halfProgressAnim")
			(layers["half2"] as! CALayer).removeAnimation(forKey: "half2ProgressAnim")
			(layers["smoke"] as! CALayer).removeAnimation(forKey: "smokeProgressAnim")
			(layers["smoke2"] as! CALayer).removeAnimation(forKey: "smoke2ProgressAnim")
			(layers["prog"] as! CALayer).removeAnimation(forKey: "progProgressAnim")
			(layers["prog2"] as! CALayer).removeAnimation(forKey: "prog2ProgressAnim")
			(layers["prog3"] as! CALayer).removeAnimation(forKey: "prog3ProgressAnim")
		}
	}
	
	func removeAllAnimations(){
		for layer in layers.values{
			(layer as! CALayer).removeAllAnimations()
		}
	}
	
}
