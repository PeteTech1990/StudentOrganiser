using StudentOrganiser.Classes;

namespace StudentOrganiser.Pages;

[QueryProperty(nameof(TaskID), "taskID")]
public partial class TaskDetails : ContentPage
{
	string? taskName;
	string? taskImportance;
	string? taskDescription;
	string? taskSubject;
	string? taskDueDate;


    public TaskDetails()
    {
        InitializeComponent();
    }

	int taskID;

	public string TaskID
	{
		get => taskID.ToString();
		set 
		{
			taskID = Convert.ToInt32(value);

			UpdateTaskDetails(taskID);
		}
	}

	private void UpdateTaskDetails(int taskID)
	{
		ToDoListTask thisTask = AllTasks.GetTask(taskID);

		this.TaskTitle.Text = thisTask.GetTitle();
		this.TaskPriority.Text = (thisTask.GetImportance() ? "!" : "");
		this.TaskDescription.Text = thisTask.GetDescription();
		this.TaskSubject.Text = thisTask.GetSubject();
		this.TaskDueDate.Text = thisTask.GetDueDate().ToString("d");
	}
}