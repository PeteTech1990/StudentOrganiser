
using StudentOrganiser.Classes;
using System.Globalization;

namespace StudentOrganiser.Pages;

public partial class Calendar : ContentPage
{

	private int selectedYear;
	private int selectedMonth;
	private List<Lesson> lessonsForThisMonth = new List<Lesson>();
	Label selectedLabel = null;


    public Calendar()
	{
		InitializeComponent();
		//App.databaseConnector.PopulateLessons();
		BuildCalendar(DateTime.Today);
		selectedMonth = DateTime.Today.Month;
		selectedYear = DateTime.Today.Year;
		try
		{

			PopulateLessonsAsync();
		}
		catch
		{
            DisplayAlert("Error", "Timetable build Failed", "OK");
        }

		
    }

	private void lessonLabel_Tapped(object sender, TappedEventArgs e)
	{
		if (selectedLabel != null)
		{
			Border lessonBorder = (Border)selectedLabel.Parent;
			lessonBorder.Stroke = Color.FromRgb(0, 0, 0);
			lessonBorder.StrokeThickness = 1;
		}
        selectedLabel = (Label)sender;
        SelectLesson();
    }

	private void SelectLesson()
	{
		if (selectedLabel != null)
		{
			Border lessonBorder = (Border)selectedLabel.Parent;
			lessonBorder.Stroke = Color.FromRgb(9, 190, 255);
			lessonBorder.StrokeThickness = 4;
		}

        Lesson selectedLesson = lessonsForThisMonth.FirstOrDefault(l => l.lessonID == Convert.ToInt32(selectedLabel.AutomationId));

        this.Subject.Text = App.databaseConnector.GetSubjectName(selectedLesson.GetSubjectID());
        this.Tutor.Text = selectedLesson.lessonTutor;
        this.Room.Text = selectedLesson.lessonClassroom;
        this.subjectIcon.Source = $"{this.Subject.Text}.jpg";
    }

		//prevMonthCLick event

		//NextMonthClick event



		private void BuildCalendar(DateTime currentCalendarMonth)
	{
        //https://stackoverflow.com/questions/6286868/convert-month-int-to-month-name
        currentMonth.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(currentCalendarMonth.Month);

		int numDays = DateTime.DaysInMonth(currentCalendarMonth.Year, currentCalendarMonth.Month);

		for (int i = 0; i < numDays; i++)
		{
			ColumnDefinition dayColumn = new ColumnDefinition();
			Border dayBorder = new Border();
			dayBorder.Stroke = Color.FromRgb(0, 0, 0);
			Label dayLabel = new Label();
			dayLabel.Text = (i + 1).ToString();
			dayLabel.FontSize = 15;
			dayLabel.WidthRequest = 100;
			
			dayBorder.Content = dayLabel;
			CalendarGrid.ColumnDefinitions.Add(dayColumn);
			CalendarGrid.SetRow(dayBorder, 0);
			CalendarGrid.SetColumn(dayBorder, i + 1);
			CalendarGrid.Children.Add(dayBorder);
		}
	}


    async Task PopulateLessonsAsync()
	{
		lessonsForThisMonth = await App.databaseConnector.GetLessonsForMonth(selectedMonth, selectedYear);

		await BuildTimetable(lessonsForThisMonth);

        SelectLesson();
    }

	async Task BuildTimetable(List<Lesson> lessonsForThisMonth)
	{
        foreach (Lesson lesson in lessonsForThisMonth)
        {
            Border lessonBorder = new Border();
            lessonBorder.Stroke = Color.FromRgb(0, 0, 0);
            lessonBorder.BackgroundColor = App.databaseConnector.GetSubjectColour(lesson.GetSubjectID());
            Label lessonLabel = new Label();
            lessonLabel.Text = lesson.GetTitle();
            lessonLabel.AutomationId = lesson.GetID().ToString();
            lessonLabel.FontSize = 15;
            lessonLabel.TextColor = Color.FromRgb(0, 0, 0);
            lessonLabel.WidthRequest = 100;
            TapGestureRecognizer lessonTap = new TapGestureRecognizer();
            lessonTap.Tapped += lessonLabel_Tapped;
            lessonLabel.GestureRecognizers.Add(lessonTap);
            lessonBorder.Content = lessonLabel;
            CalendarGrid.SetRow(lessonBorder, (lesson.GetTimePeriod() + 1));
            CalendarGrid.SetColumn(lessonBorder, lesson.GetDate().Day);
            CalendarGrid.Children.Add(lessonBorder);

			if (lesson.lessonDate.Date == new DateTime(2024, 5, 14))//DateTime.Today)
			{
				if ((DateTime.Now.Hour - 9) == lesson.GetTimePeriod())
				{ 
					selectedLabel = lessonLabel;
				}
			}
        }
    }


    private void prevMonth_Clicked(object sender, EventArgs e)
    {        
        if (selectedMonth == 1) { selectedYear = selectedYear - 1; selectedMonth = 12; }
        else { selectedMonth = selectedMonth - 1; }
        currentMonth.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(selectedMonth) + " " + selectedYear;

        PopulateLessonsAsync();
    }

    private void nextMonth_Clicked(object sender, EventArgs e)
    {
        if (selectedMonth == 12) { selectedYear = selectedYear + 1; selectedMonth = 1; }
        else { selectedMonth = selectedMonth + 1; }
        currentMonth.Text = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(selectedMonth) + " " + selectedYear;
		 
        PopulateLessonsAsync();
    }

    private void ContentPage_Appearing(object sender, EventArgs e)
    {
        PopulateLessonsAsync();
    }
}