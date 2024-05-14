package states;

class OutdatedState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var warnText:FlxText;
	override function create()
	{
		super.create();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		var guh:String;

		if (controls.mobileC) {
			guh = "Sup kiddo, looks like you're running an   \n
			outdated version of Psych Engine (" + MainMenuState.psychEngineVersion + "),\n
			please update to " + TitleState.updateVersion + "!\n
			Press B to proceed anyway.\n
			\n
			Thank you for using the Port! \n Xxgamerzin Presents (Creator)";
		} else {
			guh = "Sup bro, looks like you're running an   \n
			outdated version of Psych Engine (" + MainMenuState.psychEngineVersion + "),\n
			please update to " + TitleState.updateVersion + "!\n
			Press ESCAPE to proceed anyway.\n
			\n
			Thank you for using the Port! \n XxgamerzinXx presents (creator)";
		}

		warnText = new FlxText(0, 0, FlxG.width, guh, 32);
		warnText.setFormat("VCR OSD Mono", 32, FlxColor.RED, CENTER);
		warnText.screenCenter(Y);
		add(warnText);

		addVirtualPad('NONE', 'A_B');
	}

	override function update(elapsed:Float)
	{
		if(!leftState) {
			if (controls.ACCEPT) {
				leftState = true;
				CoolUtil.browserLoad("https://github.com/MobilePorting/FNF-PsychEngine-Mobile/releases");
			}
			else if(controls.BACK) {
				leftState = true;
			}

			if(leftState)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
				FlxTween.tween(warnText, {alpha: 0}, 1, {
					onComplete: function (twn:FlxTween) {
						MusicBeatState.switchState(new MainMenuState());
					}
				});
			}
		}
		super.update(elapsed);
	}
}
