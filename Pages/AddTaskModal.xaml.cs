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
        int taskID = await App.databaseConnector.AddTaskToDatabase(title.Text, description.Text, importanceValues[importance.SelectedItem.ToString()],((Subject)subject.SelectedItem).GetID(), duedate.Date, recurrenceValues[recurrence.SelectedItem.ToString()]);

                
        await Navigation.PopModalAsync();
    }
}