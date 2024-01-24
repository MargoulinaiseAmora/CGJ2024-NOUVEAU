using Godot;

public class PauseMenuManager : Control
{
    public override void _Ready()
    {
        GetTree().Paused = true;
    }

    public void ResumePressed()
    {
        GetTree().Paused = false;
        this.QueueFree();
    }

    public void RestartPressed()
    {        
        GetTree().Paused = false;
        GetTree().Root.GetNode("Game").Call("resetLevel");
        this.QueueFree();
    }

    public void MainMenuPressed()
    {
        PackedScene game = ResourceLoader.Load("res://assets/scenes/levels/MainMenu.scn") as PackedScene;

        var levelInstance = game.Instance();
        GetTree().Paused = false;
        GetTree().Root.AddChild(levelInstance);
        GetParent().QueueFree();
    }
}
