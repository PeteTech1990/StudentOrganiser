using CommunityToolkit.Maui.Views;

namespace StudentOrganiser.Pages;

public partial class AddTaskModal : ContentPage
{
	public AddTaskModal()
	{
		InitializeComponent();

        subject.Items.Add("English");
        recurrence.Items.Add("Daily");
        importance.Items.Add("Important");
        importance.Items.Add("Normal");
    }

    public async void AddTask(object sender, EventArgs e)
    {
        await Navigation.PopModalAsync();
    }
}