using CommunityToolkit.Maui.Views;
using CommunityToolkit.Maui.Media;
using StudentOrganiser.Classes;
using Microsoft.Maui.Layouts;

namespace StudentOrganiser.Pages;

public partial class NotesView : ContentView
{
    private Notes main;
    private Note note;

    public NotesView(Notes mainPage, Note NewNote)
    {
        InitializeComponent();
        this.note = NewNote;
        this.NoteTitle.Text = note.GetTitle();
        this.NoteSubject.Text = note.GetSubjectName();
        this.NoteDate.Text = note.GetDate().ToString("d");
        this.NoteText.Text = note.GetText();
        this.main = mainPage;

        if (note.GetAudio() != " " && note.GetAudio() != "audio")
        {


            MediaElement audioPlayer = new MediaElement();
            audioPlayer.ShouldAutoPlay = false;
            audioPlayer.ShouldShowPlaybackControls = true;
            audioPlayer.Source = note.GetAudio();
            audioPlayer.ShouldAutoPlay = false;
            audioPlayer.HeightRequest = 250;
            NoteContent.Children.Add(audioPlayer);
        }

        if (note.GetVideo() != " " && note.GetVideo() != "video")
        {
            string fileType = note.GetVideo().Substring(note.GetVideo().Length - 3);

            if (fileType == "mp4")

            {
                MediaElement videoPlayer = new MediaElement();
                videoPlayer.ShouldAutoPlay = false;
                videoPlayer.ShouldShowPlaybackControls = true;
                videoPlayer.Source = note.GetVideo();
                videoPlayer.ShouldAutoPlay = false;
                videoPlayer.HeightRequest = 250;
                NoteContent.Children.Add(videoPlayer);
            }
            else
            {

                WebView youtubeVideoViewer = new WebView();
                youtubeVideoViewer.Source = File.ReadAllText(note.GetVideo());
                youtubeVideoViewer.HeightRequest = 250;
                NoteContent.Children.Add(youtubeVideoViewer);
            }


        }





    }




    public Grid GetView()
    {
        return this.NoteView;
    }

    public Note GetNote()
    {
        return note;
    }

    private async void DeleteNote(object sender, EventArgs e)
    {
        await App.databaseConnector.RemoveNoteFromDatabase(note.GetID());
        main.GetSortAndDisplayAllNotes();
    }

}