
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
        SetTitleColour();
        this.TaskSubject.Text = toDoListTask.GetSubjectName();
        this.TaskFlag.Text = (toDoListTask.GetImportance() ? "!" : "");
        this.TaskRecurrence.Text = (toDoListTask.GetRecurrence() != 0 ? "🔄" : "");
        this.TaskDueDate.Text = toDoListTask.GetDueDate().ToString("d");
        this.TaskDone.CheckedChanged += CompleteTask;
        this.main = mainPage;
        
    }

    private async void OnTapTask(object sender, TappedEventArgs e)
    {
        await Shell.Current.GoToAsync($"tododetailspage?taskID={toDoListTask.GetID()}");
    }
        
    private void SetTitleColour()
    {
        this.TaskTitle.TextColor = App.databaseConnector.GetSubjectColour(this.toDoListTask.GetSubjectID());
    }

    public Border GetView()
    {
        return this.TaskBorder;
    }

    public ToDoListTask GetToDoTask()
    {
        return toDoListTask;
    }   

    private async void CompleteTask(object sender, CheckedChangedEventArgs e)
    {
        await App.databaseConnector.RemoveTaskFromDatabase(toDoListTask.GetID());
        //main.ClearTask(toDoListTask.GetID());
        main.GetSortAndDisplayAllTasks();
    }

    
}


