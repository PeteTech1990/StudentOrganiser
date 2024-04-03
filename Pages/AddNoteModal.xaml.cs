using CommunityToolkit.Maui.Views;

using System.Collections.ObjectModel;
using StudentOrganiser.Classes;
using Plugin.Maui.Audio;
using static Android.Provider.ContactsContract.CommonDataKinds;

namespace StudentOrganiser.Pages;

public partial class AddNoteModal : ContentPage
{
    private ObservableCollection<Subject> subjects = new ObservableCollection<Subject>();
    private ObservableCollection<Subject> Subjects { get { return subjects; } }

    private Dictionary<string, bool> importanceValues = new Dictionary<string, bool>() { { "Important", true },{ "Normal", false } };
    private Dictionary<string, int> recurrenceValues = new Dictionary<string, int>() { { "None", 0 }, { "Daily", 1 }, { "Weekly", 7 }, { "Monthly", 30 }, { "Yearly", 365 } };

    private string noteID = DateTime.Now.ToString("FFFFFF");
    private string audioPath = " ";

    public AddNoteModal()
	{
		InitializeComponent();

        subjects = App.databaseConnector.GetAllSubjects();

        subject.ItemsSource = subjects;
        subject.ItemDisplayBinding = new Binding("name");
                
    }

    public async void AddNote(object sender, EventArgs e)
    {
        await App.databaseConnector.AddNoteToDatabase(title.Text, text.Text, ((Subject)subject.SelectedItem).GetID(), audioPath, "video", DateTime.Now, Convert.ToInt32(noteID));
             
        await Navigation.PopModalAsync();
    }

    public async void OpenAudioModal(object sender, EventArgs e)
    {   
        await Navigation.PushModalAsync(new AddAudioToNoteModal(AudioManager.Current, Convert.ToInt32(noteID)));

        if(File.Exists(FileSystem.AppDataDirectory + $"/{noteID}"))
        {
            audioPath = FileSystem.AppDataDirectory + $"/{noteID}";

            MediaElement audioPlayer = new MediaElement();
            audioPlayer.ShouldAutoPlay = false;
            audioPlayer.ShouldShowPlaybackControls = true;
            audioPlayer.Source = audioPath;
            NoteContent.Children.Add(audioPlayer);
        }
    }
}