using Godot;

public class MainMenuManager : Control
{
	[Export]
	PackedScene launchLevel;

	[Export]
	PackedScene settingsMenu;

	private void PlayPressed()
	{
		if (launchLevel != null)
		{
			var levelInstance = launchLevel.Instance();
			GetTree().Root.AddChild(levelInstance);
			this.QueueFree();
		}
	}

	private void QuitPressed()
	{
		GetTree().Quit();
	}

	private void FullscreenPressed(bool button_pressed)
	{
		OS.WindowFullscreen = button_pressed;
	}

	private void SettingsPressed()
	{
		var settingsInstance = settingsMenu.Instance();
		GetTree().Root.AddChild(settingsInstance);
	}

}
