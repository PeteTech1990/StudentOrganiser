

using StudentOrganiser.Classes;

namespace StudentOrganiser.Pages;

public partial class TodoTaskView : ContentView
{
    
    private ToDoList main;
    private ToDoListTask toDoListTask;


    public TodoTaskView(ToDoList mainPage, ToDoListTask NewToDoListTask)
    {
        InitializeComponent();
        this.toDoListTask = NewToDoListTask;
        this.TaskTitle.Text = toDoListTask.GetTitle();        
        this.TaskDescription.Text = toDoListTask.GetDescription().Remove(20) + "...";
        this.TaskSubject.Text = toDoListTask.GetSubject();
        this.TaskFlag.Text = (toDoListTask.GetImportance() ? "!" : "");
        this.TaskDueDate.Text = toDoListTask.GetDueDate().ToString("d");
        this.TaskDone.CheckedChanged += CompleteTask;
        this.main = mainPage;
        
    }

    private async void OnTapTask(object sender, TappedEventArgs e)
    {
        await Shell.Current.GoToAsync($"tododetailspage?taskID={toDoListTask.GetID()}");
    }
        

    public Grid GetView()
    {
        return this.TaskView;
    }

    public int GetTaskID()
    {
        return toDoListTask.GetID();
    }

    private void CompleteTask(object sender, CheckedChangedEventArgs e)
    {   
        main.ClearTask(toDoListTask.GetID());   
    }

    
}


