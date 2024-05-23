using CommunityToolkit.Maui.Views;

using System.Collections.ObjectModel;
using StudentOrganiser.Classes;

namespace StudentOrganiser.Pages;

public partial class AddTaskModal : ContentPage
{
    private ObservableCollection<Subject> subjects = new ObservableCollection<Subject>();
    private ObservableCollection<Subject> Subjects { get { return subjects; } }

    private Dictionary<string, bool> importanceValues = new Dictionary<string, bool>() { { "Important", true },{ "Normal", false } };
    private Dictionary<string, int> recurrenceValues = new Dictionary<string, int>() { { "None", 0 }, { "Daily", 1 }, { "Weekly", 7 }, { "Monthly", 30 }, { "Yearly", 365 } };

    public AddTaskModal()
	{
		InitializeComponent();

        subjects = App.databaseConnector.GetAllSubjects();

        subject.ItemsSource = subjects;
        subject.ItemDisplayBinding = new Binding("name");

        recurrence.Items.Add("None");
        recurrence.Items.Add("Daily");
        recurrence.Items.Add("Weekly");
        recurrence.Items.Add("Monthly");
        recurrence.Items.Add("Yearly");
        recurrence.SelectedIndex = 0;

        importance.Items.Add("Important");
        importance.Items.Add("Normal");
        importance.SelectedIndex = 1;
    }

    public async void AddTask(object sender, EventArgs e)
    {
        try
        {
            ValidateInputs();
            int taskID = await App.databaseConnector.AddTaskToDatabase(title.Text, description.Text, importanceValues[importance.SelectedItem.ToString()], ((Subject)subject.SelectedItem).GetID(), duedate.Date, recurrenceValues[recurrence.SelectedItem.ToString()]);
            await Navigation.PopModalAsync();
        }
        catch(Exception ex)
        {
            await DisplayAlert("Error", ex.Message, "OK");
        }

    }

    private void ValidateInputs()
    {
        string? errorMessage = null;
        if(title.Text == "" || title.Text == null)
        {
            throw new Exception("Task title cannot be empty. Please enter a task title.");
        }        
        else if(title.Text.Length > 30)
        {
            throw new Exception("Task title cannot be more than 30 characters long. Please enter a shorter task title.");
        }
        else if(duedate.Date < DateTime.Now)
        {
            throw new Exception("Cannot set a due date for a task earlier than today. Please enter the due date as today or later.");
        }
        else if(subject.SelectedItem == null)
        {
            throw new Exception("Subject cannot be empty. Please choose a subject for this task.");
        }
        else if(description.Text == "" || description.Text == null)
        {
            throw new Exception("Task description cannot be empty. Please enter a task description");
        }
        else if (description.Text.Length > 60)
        {
            throw new Exception("Task description cannot be more than 60 characters long. Please enter a shorter task description.");
        }
    }
}