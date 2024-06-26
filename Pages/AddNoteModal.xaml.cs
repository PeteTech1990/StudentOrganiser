using CommunityToolkit.Maui.Views;

using System.Collections.ObjectModel;
using StudentOrganiser.Classes;
using Plugin.Maui.Audio;
using System.Xml.Serialization;

namespace StudentOrganiser.Pages;

public partial class AddNoteModal : ContentPage
{
    private ObservableCollection<Subject> subjects = new ObservableCollection<Subject>();
    private ObservableCollection<Subject> Subjects { get { return subjects; } }

    private Dictionary<string, bool> importanceValues = new Dictionary<string, bool>() { { "Important", true },{ "Normal", false } };
    private Dictionary<string, int> recurrenceValues = new Dictionary<string, int>() { { "None", 0 }, { "Daily", 1 }, { "Weekly", 7 }, { "Monthly", 30 }, { "Yearly", 365 } };

    private string noteID = DateTime.Now.ToString("FFFFFF");
    private string audioPath = " ";
    private string videoPath = " ";

    public AddNoteModal()
	{
		InitializeComponent();

        subjects = App.databaseConnector.GetAllSubjects();

        subject.ItemsSource = subjects;
        subject.ItemDisplayBinding = new Binding("name");

        this.NavigatedTo += NavTo;
                
    }

    public async void AddNote(object sender, EventArgs e)
    {
        try
        {
            ValidateInputs();

            await App.databaseConnector.AddNoteToDatabase(title.Text, text.Text, ((Subject)subject.SelectedItem).GetID(), audioPath, videoPath, DateTime.Now, Convert.ToInt32(noteID));

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
        if (title.Text == "" || title.Text == null)
        {
            throw new Exception("Note title cannot be empty. Please enter a note title.");
        }
        else if (title.Text.Length > 15)
        {
            throw new Exception("Note title cannot be more than 15 characters long. Please enter a shorter note title.");
        }
        else if (subject.SelectedItem == null)
        {
            throw new Exception("Subject cannot be empty. Please choose a subject for this note.");
        }
        else if (text.Text == "" || text.Text == null)
        {
            throw new Exception("Note text cannot be empty. Please enter descriptive text for this note");
        }
        else if (text.Text.Length > 100)
        {
            throw new Exception("Note text cannot be more than 100 characters long. Please enter a shorter note.");
        }
    }

    public async void OpenAudioModal(object sender, EventArgs e)
    {   
        await Navigation.PushModalAsync(new AddAudioToNoteModal(AudioManager.Current, noteID));
        
        
    }

    public async void OpenVideoModal(object sender, EventArgs e)
    {
        await Navigation.PushModalAsync(new AddVideoToNoteModal(noteID));


    }

    //Inspiration for use of MediaElement for playing Audio and Video: (Versluis, 2023)

    private void NavTo(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(1000);

        if (File.Exists(FileSystem.AppDataDirectory + $"/{noteID}.mp3"))
        {
            audioPath = FileSystem.AppDataDirectory + $"/{noteID}.mp3";

            MediaElement audioPlayer = new MediaElement();
            audioPlayer.ShouldAutoPlay = false;
            audioPlayer.ShouldShowPlaybackControls = true;
            audioPlayer.Source = audioPath;
            audioPlayer.ShouldAutoPlay = false;
            audioPlayer.HeightRequest = 100;
            NoteContent.Children.Add(audioPlayer);
        }

        if (File.Exists(FileSystem.AppDataDirectory + $"/{noteID}.mp4"))
        {
            videoPath = FileSystem.AppDataDirectory + $"/{noteID}.mp4";

            MediaElement videoPlayer = new MediaElement();
            videoPlayer.ShouldAutoPlay = false;
            videoPlayer.ShouldShowPlaybackControls = true;
            videoPlayer.Source = videoPath;
            videoPlayer.ShouldAutoPlay = false;
            videoPlayer.HeightRequest = 250;
            NoteContent.Children.Add(videoPlayer);
        }

        if (File.Exists(FileSystem.AppDataDirectory + $"/{noteID}.txt"))
        {
            videoPath = FileSystem.AppDataDirectory + $"/{noteID}.txt";

            WebView youtubeVideoViewer = new WebView();
            youtubeVideoViewer.Source = File.ReadAllText(FileSystem.AppDataDirectory + $"/{noteID}.txt");
            youtubeVideoViewer.HeightRequest = 250;
            NoteContent.Children.Add(youtubeVideoViewer);


        }
    }
}