using StudentOrganiser.Classes;

namespace StudentOrganiser.Pages;

public partial class Notes : ContentPage
{
    //AllTasks allToDos = new AllTasks();
    List<NoteGroup> noteGroups = new List<NoteGroup>();
    List<NotesView> noteViews = new List<NotesView>();

    public Notes()
    {
        InitializeComponent();

        GetSortAndDisplayAllNotes();

        AddNote.Clicked += NewNote;
        this.NavigatedTo += NavToEvent;

        sortSelect.Items.Add("Date");
        sortSelect.Items.Add("Subject");

        sortSelect.SelectedIndex = 0;

        sortLabel.Text = $"Sorted By: {sortSelect.SelectedItem.ToString()}";
        //Counter.Clicked -= OnCounterClicked; To Unsubscribe
    }

    private class NoteGroup(string title)
    {
        private string title = title;
        private List<Note> notes = new List<Note>();

        public void AddNote(Note noteToAdd)
        {
            notes.Add(noteToAdd);
        }

        public string GetTitle()
        {
            return title;
        }

        public List<Note> GetNotes()
        {
            return notes;
        }
    }

    private async void NewNote(object sender, EventArgs e)
    {
        await Navigation.PushModalAsync(new AddNoteModal());


    }

    public async void GetSortAndDisplayAllNotes()
    {
        List<Note> allNotes = await App.databaseConnector.GetAllNotes();

        if (allNotes.Count > 0)
        {
            SortNotes(allNotes, sortSelect.SelectedItem.ToString());

            this.allNotes.Children.Clear();


            foreach (NoteGroup noteGroup in noteGroups)
            {
                VerticalStackLayout noteGroupView = new VerticalStackLayout();
                Label groupLabel = new Label();
                groupLabel.Text = noteGroup.GetTitle();
                noteGroupView.Children.Add(groupLabel);
                noteGroupView.Spacing = 5;

                foreach (Note note in noteGroup.GetNotes())
                {

                    NotesView newNoteView = new NotesView(this, note);
                    noteGroupView.Children.Add(newNoteView.GetView());
                }

                this.allNotes.Children.Add(noteGroupView);
            }
        }

    }

    private void SortNotes(List<Note> allNotes, string sortType)
    {

        noteGroups.Clear();

        switch (sortType)
        {
            case "Date":
                allNotes = allNotes.OrderBy(t => t.GetDate()).ToList();
                break;
            case "Subject":
                allNotes = allNotes.OrderBy(t => t.GetSubjectName()).ThenBy(t => t.GetDate()).ToList();
                break;            
        }

        foreach (Note note in allNotes)
        {
            NoteGroup noteGroup = null;
            

            if (sortType == "Date")
            {
                var group = from t in noteGroups
                            where t.GetTitle() == (note.GetDate() < DateTime.Today.AddDays(-7) ? "Earlier" : "This Week")
                            select t;
                if (group.Count() < 1)
                {
                    NoteGroup newGroup = new NoteGroup(note.GetDate() < DateTime.Today.AddDays(-7) ? "Earlier" : "This Week");
                    noteGroup = newGroup;
                    noteGroups.Add(newGroup);
                }
                else
                {
                    noteGroup = group.FirstOrDefault();
                }

            }

            if (sortType == "Subject")
            {
                var group = from t in noteGroups
                            where t.GetTitle() == (note.GetSubjectName())
                            select t;
                if (group.Count() < 1)
                {
                    NoteGroup newGroup = new NoteGroup(note.GetSubjectName());
                    noteGroup = newGroup;
                    noteGroups.Add(newGroup);
                }
                else
                {
                    noteGroup = group.FirstOrDefault();
                }

            }

            noteGroup.AddNote(note);


        }

    }

    private void NavToEvent(object sender, NavigatedToEventArgs e)
    {
        GetSortAndDisplayAllNotes();
    }

    public async void ClearNote(int idToClear)
    {

        int indexNo = 0;

        foreach (NotesView noteView in noteViews)
        {
            Note note = noteView.GetNote();

            if (note.GetID() == idToClear)
            {
                
                await App.databaseConnector.RemoveNoteFromDatabase(idToClear);
                this.allNotes.Children.RemoveAt(indexNo);
                noteViews.RemoveAt(indexNo);
                break;
            }
            indexNo++;
        }
    }

    public void SortSelectionChanged(object sender, EventArgs e)
    {
        sortLabel.Text = $"Sorted By: {sortSelect.SelectedItem.ToString()}";

        GetSortAndDisplayAllNotes();
    }
}