using Godot;

public class SettingsManager : Node
{
	public void ChangeFramerate(int framerate)
	{
		Engine.TargetFps = framerate;
	}

	public void ChangeMusicAudio(float volume)
	{
		AudioServer.SetBusVolumeDb(2, -30*(1-volume));
	}

	public void ChangeFXAudio(float volume)
	{
		AudioServer.SetBusVolumeDb(1, -30 * (1 - volume));
	}

	public void CloseSettings()
	{
		this.QueueFree();
	}
}
