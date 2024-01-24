using Godot;

public class LevelSelectionManager : Control
{
    private void LaunchLevel(int index)
    {
        PackedScene game = ResourceLoader.Load("res://assets/scenes/levels/Game.tscn") as PackedScene;

        var levelInstance = game.Instance();
        levelInstance.Set("currentLevelIndex", index);
        GetTree().Root.AddChild(levelInstance);
        this.QueueFree();
    }
}
