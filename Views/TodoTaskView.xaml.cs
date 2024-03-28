

namespace StudentOrganiser;

public partial class TodoTaskView : ContentView
{
    //private string title;
    //private bool important;
    //private string description;
    //private string subject;
    //private DateTime DueDate;
    private Pages.ToDoList main;
    private int taskID;


    public TodoTaskView(string title, bool important, string description, string subject, DateTime DueDate, Pages.ToDoList mainPage, int taskID)
    {
        InitializeComponent();
        this.TaskTitle.Text = title;
        this.TaskDescription.Text = description.Remove(20) + "...";
        this.TaskSubject.Text = subject;
        this.TaskFlag.Text = (important ? "!" : "");
        this.TaskDueDate.Text = DueDate.ToString("d");
        this.TaskDone.CheckedChanged += CompleteTask;
        this.main = mainPage;
        this.taskID = taskID;
    }
        

    public Grid GetView()
    {
        return this.TaskView;
    }

    public int GetID()
    {
        return taskID;
    }

    private void CompleteTask(object sender, CheckedChangedEventArgs e)
    {
        main.ClearTask(taskID);   
    }

    
}


