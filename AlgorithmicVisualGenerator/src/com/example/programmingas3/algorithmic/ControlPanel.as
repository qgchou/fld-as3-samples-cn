﻿package com.example.programmingas3.algorithmic
{
	import flash.display.MovieClip;
	import fl.events.SliderEvent;
	import fl.controls.Slider;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.StageDisplayState;

	public class ControlPanel extends MovieClip
	{
		public var radius:Number = 50;
		public var satelliteRadius:Number = 6;
		public var totalSatellites:Number = 600;		
		public var visibleSatellites:Number = 100;
		public var redBias:Number = 0xFF;
		public var greenBias:Number = 0xFF;
		public var blueBias:Number = 0xFF;
		public var useAlphaEffect:Boolean = false;
		
		public function ControlPanel() {
			radiusSlider.addEventListener(SliderEvent.CHANGE,changeSetting);
			satelliteRadiusSlider.addEventListener(SliderEvent.CHANGE,changeSetting);
			visibleSatellitesSlider.addEventListener(SliderEvent.CHANGE,changeSetting);
			redSlider.addEventListener(SliderEvent.CHANGE,changeSetting);
			greenSlider.addEventListener(SliderEvent.CHANGE,changeSetting);
			blueSlider.addEventListener(SliderEvent.CHANGE,changeSetting);

			radiusSlider.minimum = 2;
			radiusSlider.maximum = 200;
			radiusSlider.value = radius;
			satelliteRadiusSlider.minimum = 2;
			satelliteRadiusSlider.maximum = 40
			satelliteRadiusSlider.value = satelliteRadius;
			visibleSatellitesSlider.minimum = 0;
			visibleSatellitesSlider.maximum = totalSatellites;
			visibleSatellitesSlider.value = visibleSatellites;
			redSlider.minimum = 
			greenSlider.minimum = 
			blueSlider.minimum = 0;
			redSlider.maximum = 
			greenSlider.maximum = 
			blueSlider.maximum = 0xFF;
			redSlider.value = redBias;
			greenSlider.value = greenBias;
			blueSlider.value = blueBias;
			
			fullScreenBtn.addEventListener(MouseEvent.CLICK, toggleFullScreen);
			alphaShadingBtn.addEventListener(MouseEvent.CLICK, toggleAlphaShading);
		}
		
		protected function changeSetting(e:SliderEvent):void {
			switch(e.target) {
				case radiusSlider:
					radius = e.target.value;
					break;
				case satelliteRadiusSlider:
					satelliteRadius = e.target.value;
					break;
				case visibleSatellitesSlider:
					visibleSatellites = e.target.value;
					break;
				case redSlider:
					redBias = e.target.value;
					dispatchEvent(new Event("rebuild"));
					break;
				case greenSlider:
					greenBias = e.target.value;
					dispatchEvent(new Event("rebuild"));
					break;
				case blueSlider:
					blueBias = e.target.value;
					dispatchEvent(new Event("rebuild"));
					break;
				default:
					break;
			}
		}
		protected function toggleFullScreen(e:MouseEvent):void {
			stage.displayState = stage.displayState == StageDisplayState.FULL_SCREEN ? StageDisplayState.NORMAL : StageDisplayState.FULL_SCREEN;
		}
		protected function toggleAlphaShading(e:MouseEvent):void {
			useAlphaEffect = useAlphaEffect == true ? false : true;
		}
	}
}